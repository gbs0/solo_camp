class ApplicationService
    def self.call(*args, &block)
      new(*args, &block).call
    end

    def self.digest(*args, &block)
      new(*args, &block).digest
    end

    def self.zone(*args, &block)
        new(*args, &block).zone
    end

    def self.timestamp(*args, &block)
        new(*args, &block).timestamp
    end

    def self.datetime(*args, &block)
        new(*args, &block).datetime
    end
  end