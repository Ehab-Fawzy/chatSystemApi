class RemoveNumberFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :number, :integer
  end
end
