class AddLaudosToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :laudo, foreign_key: true
  end
end
