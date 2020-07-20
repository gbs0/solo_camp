class Laudo < ApplicationRecord
  has_one: :property
  has_one: :insumo
end