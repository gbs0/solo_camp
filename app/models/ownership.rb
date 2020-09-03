class Ownership < ApplicationRecord
  # belongs_to :property, foreign_key: :ownership
  belongs_to :user, foreign_key: :user
end
