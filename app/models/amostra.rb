class Amostra < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :property, foreign_key: :property_id

  validate :user_id,
    :property_id
    # :profundidade,
    # :peso,
    # :argila,
    # :potassio,
    # :calcario,
    # :magnesio,
    # :enxofre20,
    # :enxofre40,
    # :hidrogenio,
    # :alcalinidade,
    # :boro,
    # :cobre,
    # :manganes,
    # :zinco,
    # :carbono
  scope :by_user, -> (_id) { where("user_id = ?", _id) }
  
  scope :by_property, -> (_id) { where("property_id = ?", _id) }

  scope :for_all_properties, -> (_property_id) do
    joins(:amostras).where(property: { property_id: _property_id })
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
