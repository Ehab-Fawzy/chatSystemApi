class RemoveChatappsIdFromChatapps < ActiveRecord::Migration[5.2]
  def change
    remove_column :chatapps, :chatapps_id, :bigint
  end
end
