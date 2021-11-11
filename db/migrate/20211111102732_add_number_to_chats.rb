class AddNumberToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :number, :integer
    add_index :chats, :number
  end
end
