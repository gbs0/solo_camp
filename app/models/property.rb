class Property < ApplicationRecord
  STATES = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"]
  belongs_to :user, foreign_key: :user_id
  # belongs_to :laudo, foreign_key: :property
  has_many :amostras, dependent: :destroy
  has_many :analises, dependent: :destroy

  validate :name, :address, :city, :uf, :cep, :total_area

  before_create :address_to_coordinates
  before_update :address_to_coordinates
  
  def build_coordinates(_lat, _lng)
    self.lat = _lat
    self.lng = _lng
  end

  def address_to_coordinates
    unless self.address.blank?
      response = get_places_coordinates
      coordinates = response["results"].map{ |coordinates| coordinates['geometry']['location']}
      self.build_coordinates(coordinates[0]['lat'], coordinates[0]['lgn']) unless coordinates.nil?
      binding.pry
    end 
  end

  def get_places_coordinates
    places_key = Rails.application.secrets['places_key'] if Rails.env.development?
    places_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{self.name},#{self.address}&key=#{places_key}"
    response = Net::HTTP.get(URI(@places_url))
    JSON.parse(response)
  end
end