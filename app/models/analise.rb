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

    scope :by_user, -> (_id) { where("user_id = ?", _id) }

    scope :for_all_properties, -> (_property_id) do
      joins(:amostras).where(property: { property_id: _property_id })
    end

    def get_insumo_name
      self.insumo_name = Insumo.get_name(self.insumo_id)
    end

    def coordinates_to_place; end
    
    def build(attr = {})
      self.user_id = attr[:user_id]
      self.solicitante = attr[:name]
      
      self.property_id = Property.by_id(attr[:property]).id
      self.property_name = Property.by_id(attr[:property]).name
      
      self.ownership_id = Ownership.by_id(attr[:ownership]).id
      self.owner_name = Ownership.by_id(attr[:ownership]).name

      self.insumo_id = Insumo.by_id(attr[:insumo]).id
      self.insumo_name = Insumo.by_id(attr[:insumo]).name
    end
  end