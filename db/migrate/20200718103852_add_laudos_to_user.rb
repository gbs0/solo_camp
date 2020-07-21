class AddLaudosToUsers < ActiveRecord::Migration[5.1]
    def change
      add_column :users, :laudo_id, :references, :foreign_key true
    end
  end
  