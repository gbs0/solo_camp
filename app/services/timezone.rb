class Timezone < ApplicationService
    attr_reader :zone, :time

    def initialize(timestamp)
        @time = timestamp
        @zone = "America/Sao_Paulo"
    end

    def timestamp
      Time.zone = self.zone
      Time.zone.parse(args.first).strftime('%H :%M :%S')
    end

    def datetime
      binding.pry
        Time.zone = self.zone
        Time.zone.parse(@time).strftime('%D/%M/%Y on %H :%M :%S')
    end

    def zone
      @zone
    end
end