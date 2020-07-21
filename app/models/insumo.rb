class Insumo < ApplicationRecord
  belongs_to :laudo, foreign_key: :insumo_id
end
