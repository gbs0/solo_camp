class AnaliseAmostra < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :ownership

  has_many :amostras

  def self.build_json(amostra)
    amostra.attributes
  end

end
