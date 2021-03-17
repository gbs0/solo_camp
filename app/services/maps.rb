class Maps < ApplicationService
    attr_reader :lat, :lng
    
    def initialize(_lat, _lng)
      @lat = _lat
      @lng = _lng
      @key = Rails.application.secrets['maps_key'] if Rails.enviroment.development?
    end 

    def call; end

end