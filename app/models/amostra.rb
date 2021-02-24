class Amostra < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :property, foreign_key: :property_id
  has_many :analise_amostras
  has_many :analise, through: :analise_amostras

   
  
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
end
