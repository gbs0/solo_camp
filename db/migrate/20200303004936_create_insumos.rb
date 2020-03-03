class CreateInsumos < ActiveRecord::Migration[5.1]
  def change
    create_table :insumos do |t|

      t.timestamps
    end
  end
end
