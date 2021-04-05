class Places < ApplicationService
    attr_accessor :_name, :_address, :_city, :_uf

    def initialize(_name, _address, _city, _uf)
        @name = I18n.transliterate(_name)
        @address = I18n.transliterate(_address)
        @city = I18n.transliterate(_city)
        @uf = _uf
        @key = Rails.application.secrets['places_key']
    end

    def call
        unless @key.nil?
            place_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{@name},#{@address},#{@city}-#{@uf}&key=#{@key}"
            uri = URI(place_url)
            place_fetch = Net::HTTP.get(uri)
            JSON.parse(place_fetch)
        end
    end
end