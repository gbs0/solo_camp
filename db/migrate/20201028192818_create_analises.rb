class CreateAnalises < ActiveRecord::Migration[5.1]
  def change
    create_table :analises do |t|
      t.string :solicitante
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      t.references :amostra, foreign_key: true
      t.references :ownership, foreign_key: true
      t.string :proprietario
      t.references :insumo, foreign_key: true
    end
  end
end
