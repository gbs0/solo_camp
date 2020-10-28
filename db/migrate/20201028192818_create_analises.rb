class CreateAnalises < ActiveRecord::Migration[5.1]
  def change
    create_table :analises do |t|
      t.string :solicitante
      t.references :user_id, foreign_key: true
      t.references :property_id, foreign_key: true
      t.references :amostra_id, foreign_key: true
      t.references :ownership_id, foreign_key: true
      t.string :proprietario
      t.references :insumo_id, foreign_key: true
    end
  end
end
