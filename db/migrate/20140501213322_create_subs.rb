class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
    add_index :subs, :title, unique: true
  end
end
