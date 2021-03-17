class TimezoneService
    def self.zone(*args, &block)
        new(*args, &block).zone
    end

    def self.timestamp(*args, &block)
        new(*args, &block).timestamp
    end

    def self.datetime(*args, &block)
        new(*args, &block).datetime
    end

    def self.date_threshold(*args, &block)
        new(*args, &block).date_threshold
    end
end