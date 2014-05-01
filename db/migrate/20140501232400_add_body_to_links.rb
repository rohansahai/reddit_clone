class AddBodyToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.text :body
    end
  end
end
