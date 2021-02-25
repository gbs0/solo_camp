class AnaliseAmostra < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :ownership

  has_many :amostras

end
