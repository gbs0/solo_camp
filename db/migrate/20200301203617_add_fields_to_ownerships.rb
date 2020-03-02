class AddFieldsToOwnerships < ActiveRecord::Migration[5.1]
  def change
    add_column :ownerships, :last_name, :string

  end
end
