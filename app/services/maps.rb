class Maps < ApplicationService
    attr_reader :lat, :lng
    
    def initialize(_lat, _lng)
      @lat = _lat
      @lng = _lng
      @key = Rails.application.secrets['map_static_key'] if Rails.env.development?
    end 

    def call
        unless @key.nil?
            place_url = "https://maps.googleapis.com/maps/api/staticmap?center=#{@lat},#{@lng}&zoom=15&size=800x500&maptype=roadmap
            &markers=color:green%7Clabel:S%7C#{@lat},#{@lng}&key=#{@key}"
        end
    end
    

end