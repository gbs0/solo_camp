class Maps < ApplicationService
    attr_reader :lat, :lng
    
    def initialize(_lat, _lng)
      @lat = _lat
      @lng = _lng
      @key = Rails.application.secrets['map_static_key'] if Rails.env.development?
    end 

    def call
        unless @key.nil?
            place_url = "https://maps.googleapis.com/maps/api/staticmap?center=Y&zoom=13&size=600x300&maptype=roadmap
            &markers=color:green%7Clabel:S%7C#{@lat},#{@lng}&key=#{@key}"
            uri = URI(place_url)
            place_fetch = Net::HTTP.get(uri)
        end
    end
    

end