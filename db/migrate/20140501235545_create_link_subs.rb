class CreateLinkSubs < ActiveRecord::Migration
  def change
    create_table :link_subs do |t|
      t.references :links, index: true
      t.references :subs, index: true

      t.timestamps
    end
  end
end
