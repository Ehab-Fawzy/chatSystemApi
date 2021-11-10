class AddChatNumberToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :chat_number, :integer
  end
end
