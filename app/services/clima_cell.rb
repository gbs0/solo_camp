class ClimaCell < ApplicationService
    attr_accessor :_lat, :lng

    def initialize(_lat, _lng)
        @lat = _lat
        @lng = _lng
        @key = Rails.application.secrets['clima_key'] if Rails.env.development?
    end


    def call
        fetch = `curl --request GET --url \
        'https://data.climacell.co/v4/timelines?location=#{@lat},#{lng}&fields=temperature&timesteps=current&units=metric&apikey=#{@key}'`
        JSON.parse(fetch)
    end

    def self.threshold_timestamp(json)
      json['data']['timelines'][0]['timestep'] unless json.nil?
    end

    def self.celsius(json)
        json['data']['timelines'][0]['intervals'][0]['values']['temperature'] unless json.nil?
    end

    def self.timestamp(json)
        json['data']['timelines'][0]['endTime'] unless json.nil?
    end
    
end