class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :city, :string
    add_column :properties, :uf, :string
    add_column :properties, :gleba, :string
  end
end
