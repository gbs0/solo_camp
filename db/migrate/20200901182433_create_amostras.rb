class CreateAmostras < ActiveRecord::Migration[5.1]
  def change
    create_table :amostras do |t| 
      t.string :property_name
      t.integer :profundidade
      t.integer :compactacao
      t.integer :peso
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
