class Maps < ApplicationService
    attr_reader :lat, :lng
    
    def initialize(_lat, _lng)
      @lat = _lat
      @lng = _lng
      @key = Rails.application.secrets['maps_key'] if Rails.enviroment.development?
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