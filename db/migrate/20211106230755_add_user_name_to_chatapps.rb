class AddUserNameToChatapps < ActiveRecord::Migration[5.2]
  def change
    add_column :chatapps, :username, :string
  end
end
