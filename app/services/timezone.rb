class Timezone < ApplicationService
    attr_reader :zone

    def initialize
        @zone = "America/Sao_Paulo"
    end

    def self.timestamp(*args)
      Time.zone = self.zone
      Time.zone.parse(args).strftime('%H :%M : %S')
    end

    def zone
      @zone
    end
end