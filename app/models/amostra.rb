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
