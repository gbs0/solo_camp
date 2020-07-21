class Property < ApplicationRecord
  belongs_to: :laudo, foreign_key: :property
end
