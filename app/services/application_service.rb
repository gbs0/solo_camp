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
  end