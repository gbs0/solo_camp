class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.references :ownership, foreign_key: true

      t.timestamps
    end
  end
end
