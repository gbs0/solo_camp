class AddFieldsToInsumos < ActiveRecord::Migration[5.1]
  def change
    add_column :insumos, :name, :string
  end
end
