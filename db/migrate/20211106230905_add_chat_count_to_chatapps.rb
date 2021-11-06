class AddChatCountToChatapps < ActiveRecord::Migration[5.2]
  def change
    add_column :chatapps, :chat_count, :integer
  end
end
