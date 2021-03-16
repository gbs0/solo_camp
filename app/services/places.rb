class Places < ApplicationService
    def initialize(attr={})
        _address = attr['address']
        @key = Rails.application.secrets['places_key'] if Rails.env.development?
    end

    def call
        #places_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{self.name},#{self.address},#{self.city}-#{self.uf}&key=#{places_key}"
        uri = URI(places_url)
        response = Net::HTTP.get(uri)
        JSON.parse(response)
    end
end