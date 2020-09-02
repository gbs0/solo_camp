class AddCpfToOwnerships < ActiveRecord::Migration[5.1]
  def change
    add_column :ownerships, :cpf, :integer
  end
end
