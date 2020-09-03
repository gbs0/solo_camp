class AddUserReferenceToOwnership < ActiveRecord::Migration[5.1]
  def change
    add_reference :ownerships, :user, foreign_key: true
  end
end
