class CreateAnaliseAmostras < ActiveRecord::Migration[5.1]
  def change
    create_table :analise_amostras do |t|
      t.references :user, foreign_key: true
      t.references :analise, foreign_key: true
      t.json :amostras
      
      t.timestamps
    end
  end
end
