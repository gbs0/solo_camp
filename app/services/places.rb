class Places < ApplicationService
    attr_accessor :_name, :_address, :_city, :_uf

    def initialize(_name, _address, _city, _uf)
        @name = _name
        @address = _address
        @city = _city
        @uf = _uf
        @key = Rails.application.secrets['places_key'] if Rails.env.development?
    end

    def call
        places_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{@name},#{@address},#{@city}-#{@uf}&key=#{@key}"
        uri = URI(places_url)
        response = Net::HTTP.get(uri)
        JSON.parse(response)
    end
end