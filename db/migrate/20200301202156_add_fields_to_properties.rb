class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :address, :string
    add_column :properties, :city, :string
    add_column :properties, :uf, :string
    add_column :properties, :cep, :integer
    add_column :properties, :cep_prefix, :integer
    add_column :properties, :area, :integer
  end
end
