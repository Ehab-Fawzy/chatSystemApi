class CreateChatapps < ActiveRecord::Migration[5.2]
  def change
    create_table :chatapps do |t|
      t.string :token
      t.string :name
      t.string :username
      t.string :password
      t.timestamps
    end

    def create

    end
  end
end
