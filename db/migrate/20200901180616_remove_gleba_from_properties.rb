class RemoveGlebaFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :gleba, :string
  end
end
