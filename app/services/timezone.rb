class Timezone < TimezoneService
    attr_reader :zone, :time
    include ActionView::Helpers::DateHelper

    def initialize(timestamp)
        @time = timestamp
        @zone = "America/Sao_Paulo"
    end

    def timestamp
      Time.zone = self.zone
      Time.zone.parse(self.time).strftime('%H :%M :%S')
    end

    def datetime
        Time.zone = self.zone
        Time.zone.parse(self.time).strftime('%D as %H:%M')
    end

    def date_threshold
      Time.zone = self.zone
      _date = Time.zone.parse(self.time)
      distance_of_time_in_words(Time.current - _date)
    end
    
    def zone
      @zone
    end
end