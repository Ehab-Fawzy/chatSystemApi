class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.string :username
      t.integer :number
      t.string :other

      t.timestamps
    end
  end
end
