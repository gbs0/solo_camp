class Insumo < ApplicationRecord
  # belongs_to :laudo, foreign_key: :insumo_id

  validates :name, presence: true
end
