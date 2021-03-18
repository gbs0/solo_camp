class Analise < ApplicationRecord
    belongs_to :insumo, foreign_key: :insumo_id
    belongs_to :user, foreign_key: :user_id
    has_one :property
    # has_one :ownership, through: :property, foreign_key: :proprietario
    has_one :ownership, foreign_key: :ownership_id
    # has_one :insumo, foreign_key: :insumo_id
    has_many :analise_amostras, dependent: :destroy
    
    # has_many :amostras, through: :analise_amostras, dependent: :destroy

    before_create :get_insumo_name

    scope :by_property, -> (_id) { where("property_id = ?", _id) }

    def get_insumo_name
      self.insumo_name = Insumo.get_name(self.insumo_id)
    end

    def coordinates_to_place; end
    
  end