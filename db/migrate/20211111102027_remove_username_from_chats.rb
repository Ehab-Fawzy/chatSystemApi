class RemoveUsernameFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :username, :string
  end
end
