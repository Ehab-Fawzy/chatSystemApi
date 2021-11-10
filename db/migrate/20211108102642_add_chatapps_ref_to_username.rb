class AddChatappsRefToUsername < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatapps, :chatapps, foreign_key: true
  end
end
