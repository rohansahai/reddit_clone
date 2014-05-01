class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true
      t.references :link, index: true
      t.references :comment, index: true

      t.timestamps
    end
  end
end
