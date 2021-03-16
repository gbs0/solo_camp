class ClimaCell < ApplicationService
    attr_accessor :_lat, :lng

    def initialize(_lat, _lng)
        @lat = _lat
        @lng = _lng
        @key = Rails.application.secrets['clima_key'] if Rails.env.development?
    end


    def call
        fetch = `curl --request GET --url \
        'https://data.climacell.co/v4/timelines?location=#{@lat},#{lng}&fields=temperature&timesteps=1h&units=metric&apikey=#{@key}'`
        JSON.parse(fetch)
    end
    
end