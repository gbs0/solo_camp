class AnaliseAmostra < ApplicationRecord
  belongs_to :user
  belongs_to :analise
  
  has_many :amostras
end
