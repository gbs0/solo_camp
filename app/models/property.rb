class Property < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  # belongs_to :laudo, foreign_key: :property
  has_many :amostras

  validate :name, :address, :city, :uf, :cep, :field_area
end