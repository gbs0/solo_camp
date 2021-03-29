class Ownership < ApplicationRecord
  # belongs_to :property, foreign_key: :ownership
  belongs_to :user, foreign_key: :user_id

  scope :by_id, -> (_id) { find_by("id = ?", _id) }

  def is_present?
    
  end

  def self.total_record_count
    Ownership.all.count
  end
end
