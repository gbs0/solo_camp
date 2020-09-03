class AddFieldsToOwnerships < ActiveRecord::Migration[5.1]
  def change
    add_column :ownerships, :cpf, :string
    add_column :ownerships, :rg, :integer
    add_column :ownerships, :cnpj, :string
    add_column :ownerships, :email, :string
    add_column :ownerships, :telefone, :string
  end
end
