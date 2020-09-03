class CreateAmostras < ActiveRecord::Migration[5.1]
  def change
    create_table :amostras do |t|
      t.string :owner_name
      t.integer :cpf
      t.string :telefone
      t.string :property_name
      t.integer :profundidade
      t.integer :compactacao
      t.integer :peso
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
