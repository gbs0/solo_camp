class Laudo < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_one :property
  has_one :ownership, through: :property, foreign_key: :proprietario
  has_one :insumo
end