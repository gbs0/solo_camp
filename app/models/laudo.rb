class Laudo < ApplicationRecord
  has_one :property
  has_one :ownership, through: :property, foreign_key: :proprietario
  has_one :insumo
end