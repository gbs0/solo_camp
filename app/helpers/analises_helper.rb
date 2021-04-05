module AnalisesHelper
    def self.count(analise)
        analise.count
    end

    def available?(analise); end
    
    def is_empty?(analise); end
end