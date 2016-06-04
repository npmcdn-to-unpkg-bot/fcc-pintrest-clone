class AddUsernameToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :username, :string
    add_index :identities, :username
  end
end
