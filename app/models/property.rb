class Property < ApplicationRecord
  STATES = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"]
  belongs_to :user, foreign_key: :user_id
  # belongs_to :laudo, foreign_key: :property
  has_many :amostras, dependent: :destroy
  has_many :analises, dependent: :destroy

  validate :name, :address, :city, :uf, :cep, :total_area
end