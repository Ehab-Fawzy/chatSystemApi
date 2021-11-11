class AddChatNumberToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :chat_number, :integer
    add_index :messages, :chat_number
  end
end
