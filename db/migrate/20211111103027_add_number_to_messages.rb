class AddNumberToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :number, :integer
    add_index :messages, :number
  end
end
