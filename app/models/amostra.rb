class Amostra < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :property, foreign_key: :property_id

  # Validação do Banco
  # validates :user_id, :property_id, presence: true 
  
  # Validação de propriedades fisicas
  # validates :peso, :profundidade

  # Validação de Acidez
  validates :hidrogenio, :alcalinidade, presence: true, numericality: true

  # Validação de Bases
  validates :argila, :potassio, :magnesio, :calcario, presence: true, numericality: {greater_than: 0}
  
  # Validação de Enxofre
  validates :enxofre20, presence: true # min: 0, max: 20
  validates :enxofre40, presence: true # min: 21, max: 40
  
  # Validação de Micromutrientes
  validates :boro, :cobre, :manganes, :zinco, presence: true, numericality: true

  # Validação de Carbono
  validates :carbono, presence: true, numericality: true

  
  scope :by_user, -> (_id) { where("user_id = ?", _id) }
  
  scope :by_property, -> (_id) { where("property_id = ?", _id) }

  scope :for_all_properties, -> (_property_id) do
    joins(:amostras).where(property: { property_id: _property_id })
  end

  scope :by_id, -> (_ids) do
    joins(:amostras).where(id: _ids)
  end

  def serialize(amostra)
    ActiveSupport::JSON.encode(amostra) unless amostra.nil?
  end

  def get_owner_name(id); end

  def get_user_name(id); end

  def get_property_name(id); end

  def load(value)
    ActiveSupport::JSON.decode(value)
  end

end
