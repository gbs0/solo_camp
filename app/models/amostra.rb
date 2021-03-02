class Amostra < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :property, foreign_key: :property_id
  
  validate :user_id,
    :property_id,
    :profundidade,
    :peso,
    :argila,
    :potassio,
    :calcario,
    :magnesio,
    :enxofre20,
    :enxofre40,
    :hidrogenio,
    :alcalinidade,
    :boro,
    :cobre,
    :manganes,
    :zinco,
    :carbono

  def self.serialize_json(amostra)
    @amostra = amostra.serializable_hash
    case @amostra
    when Hash, Amostra
      # ActiveSupport::JSON.encode(@amostra)
      @amostra.as_json
    else
      super
    end
  end
end
