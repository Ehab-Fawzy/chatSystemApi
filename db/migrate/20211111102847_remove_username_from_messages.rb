class RemoveUsernameFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :username, :string
  end
end
