class RemoveNumberFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :number, :integer
  end
end
