class Analise < ApplicationRecord
    belongs_to :user, foreign_key: :user
    has_one :property
    # has_one :ownership, through: :property, foreign_key: :proprietario
    has_one :ownership, foreign_key: :ownership_id
    has_one :insumo
    has_many :amostras, foreign_key: :amostra
  end