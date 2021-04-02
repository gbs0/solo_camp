class AnaliseAmostra < ApplicationRecord
  belongs_to :user
  belongs_to :analise

  def self.concat(amostra_as_json)
    self.amostras =  AnaliseAmostra.concat(", #{amostra_as_json}")
    # self.amostras_will_change!
    # listing.vendors[:hd].merge!({ foo: 'bar' })
    listing.save! # throws no exceptions in the log
  end

  def build(attr = {})
    self.user_id = attr[:current_user].id
    self.analise_id = attr[:analise].id  
    self.amostra = Amostra.serialize(attr[:amostras])
    self.insumo = attr[:insumo]
  end
end
