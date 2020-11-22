class AnaliseAmostra < ApplicationRecord
  belongs_to :user
  belongs_to :analise
  belongs_to :amostra
end
