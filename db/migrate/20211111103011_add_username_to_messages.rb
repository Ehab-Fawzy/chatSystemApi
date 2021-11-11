class AddUsernameToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :username, :string
    add_index :messages, :username
  end
end
