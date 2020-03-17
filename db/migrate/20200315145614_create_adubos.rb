class CreateAdubos < ActiveRecord::Migration[5.1]
  def change
    create_table :adubos do |t|
      t.string :comercial_name
      t.integer :n
      t.integer :p
      t.integer :k
      t.decimal :preco_saca
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
