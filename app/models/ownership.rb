class Ownership < ApplicationRecord
  belongs_to :property, foreign_key: :ownership
end
