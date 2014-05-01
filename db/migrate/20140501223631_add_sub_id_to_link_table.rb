class AddSubIdToLinkTable < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :sub
    end
  end
end
