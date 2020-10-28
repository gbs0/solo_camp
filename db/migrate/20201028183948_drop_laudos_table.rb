class DropLaudosTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :laudos, :solicitante
    remove_column :laudos, :user_id
    remove_column :laudos, :proprietario
    remove_column :laudos, :insumo_id
    remove_column :laudos, :property_id
    remove_column :laudos, :created_at
    remove_column :laudos, :updated_at
  end
end
