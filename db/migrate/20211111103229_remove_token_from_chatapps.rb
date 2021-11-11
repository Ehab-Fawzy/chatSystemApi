class RemoveTokenFromChatapps < ActiveRecord::Migration[5.2]
  def change
    remove_column :chatapps, :token, :string
  end
end
