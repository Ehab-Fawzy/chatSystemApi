class AddPasswordToChatapps < ActiveRecord::Migration[5.2]
  def change
    add_column :chatapps, :password, :string
  end
end
