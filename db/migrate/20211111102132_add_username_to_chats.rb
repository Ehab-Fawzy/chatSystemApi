class AddUsernameToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :username, :string
    add_index :chats, :username
  end
end
