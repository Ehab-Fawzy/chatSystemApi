class AddIndexToApps < ActiveRecord::Migration[5.2]
  def change
    remove_index :chatapps, :username
  end
end
