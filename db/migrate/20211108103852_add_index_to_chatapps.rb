class AddIndexToChatapps < ActiveRecord::Migration[5.2]
  def change
    add_index :chatapps, :username, unique: true
  end
end
