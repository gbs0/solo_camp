class AddPropertiesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :users, foreign_key: true
  end
end
