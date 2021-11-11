class AddTokenToChatapps < ActiveRecord::Migration[5.2]
  def change
    add_column :chatapps, :token, :string
    add_index :chatapps, :token
  end
end
