class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :token

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :token, unique: true
  end
end
