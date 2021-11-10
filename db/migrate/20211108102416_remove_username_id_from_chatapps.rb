class RemoveUsernameIdFromChatapps < ActiveRecord::Migration[5.2]
  def change
    remove_column :chatapps, :username, :string
  end
end
