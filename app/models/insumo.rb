class Insumo < ApplicationRecord
  # belongs_to :laudo, foreign_key: :insumo_id
  # has_many :analises, dependent: :destroy
  
  validates :name, presence: true
end
