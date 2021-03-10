class AnaliseAmostra < ApplicationRecord
  belongs_to :user
  belongs_to :analise

  def self.concat(amostra_as_json)
    self.amostras =  AnaliseAmostra.concat(", #{amostra_as_json}")
    # self.amostras_will_change!
    # listing.vendors[:hd].merge!({ foo: 'bar' })
    listing.save! # throws no exceptions in the log
  end
end
