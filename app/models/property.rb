class Property < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  # belongs_to :laudo, foreign_key: :property
  has_many :amostras, dependent: :destroy
  has_many :analises, dependent: :destroy

  validate :name, :address, :city, :uf, :cep, :total_area

  before_create :location_to_coordinates
  before_update :location_to_coordinates
  
  STATES = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"]
  
  def build_coordinates(_lat, _lng)
    self.lat = _lat
    self.lng = _lng
  end

  def formatted_address(_address)
    self.formatted_address = _address
  end

  def location_to_coordinates
    response = retrieve_places
    unless response['results'].blank?
      coordinates = response["results"].map{|coordinates| coordinates['geometry']['location']}
      address = response["results"].map {|infos| infos["formatted_address"]}
      self.build_coordinates(coordinates[0]['lat'], coordinates[0]['lng']) unless coordinates.nil?
      self.formatted_address(address[0])
    end 
  end
  
  def retrieve_places
    places_key = Rails.application.secrets['places_key'] if Rails.env.development?
    places_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{self.name},#{self.address},#{self.city}-#{self.uf}&key=#{places_key}"
    uri = URI(places_url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.convert_coordinates(_coordinate)
    _coordinate.to_f unless _coordinate.blank?   
  end

  def self.serialize_weather(attr = {})
    _lat = attr['lat']
    _lng = attr['lng']

    # Call class method
  end

end