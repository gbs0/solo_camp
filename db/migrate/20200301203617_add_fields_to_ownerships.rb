class AddFieldsToOwnerships < ActiveRecord::Migration[5.1]
  def change
    add_column :ownerships, :last_name, :string
    add_column :ownerships, :cpf, :string
    add_column :ownerships, :cnpj, :string
    add_column :ownerships, :email, :string
  end
end
