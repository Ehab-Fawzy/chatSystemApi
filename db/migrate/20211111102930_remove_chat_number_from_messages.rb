class RemoveChatNumberFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :chat_number, :integer
  end
end
