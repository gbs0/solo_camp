class Property < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  # belongs_to :laudo, foreign_key: :property
  has_many :analises

  validate :ownership_id, :name, :address, :city, :uf, :cep, :cep_prefix
end
