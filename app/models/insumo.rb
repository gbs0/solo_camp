class Insumo < ApplicationRecord
  # belongs_to :laudo, foreign_key: :insumo_id
  # has_many :analises, dependent: :destroy
  
  validates :name, presence: true

  scope :by_id, -> (_id) { find_by("id = ?", _id) }
  
  def self.get_name(id)
    Insumo.find(id).name unless id.blank?
  end
end
