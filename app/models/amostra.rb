class Amostra < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
    # belongs_to :laudo, foreign_key: :property
  
  validate :owner_name,
    :property_name,
    :profundidade,
    :compactacao,
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
    :carbono,
    :materia,
    :valor,
    :ctc
end
