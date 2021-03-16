class ClimaCell < ApplicationService
    attr_acessor :_lat, :lng

    def initialize(_lat, _lng)
        @lat = _lat
        @lng = _lng
        @key = Rails.application.secrets['clima_key'] if Rails.env.development?
    end


    def call 
        fetch = `curl --request GET --url \
        'https://data.climacell.co/v4/timelines?location=-73.98529171943665,40.75872069597532&fields=temperature&timesteps=1h&units=metric&apikey=#{@key}'`
        response = JSON.parse(fetch)
        binding.pry
    end
    
end