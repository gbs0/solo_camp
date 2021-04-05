class CreateAnaliseAmostras < ActiveRecord::Migration[5.1]
  def change
    create_table :analise_amostras do |t|
      t.references :user, foreign_key: true
      t.references :analise, foreign_key: true
      t.jsonb :amostra, null: false, default: {}
      t.string :insumo, default: ""
      
      t.timestamps
    end
  end
end
