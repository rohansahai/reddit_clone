class ChangeColumnNamesLinkSubTable < ActiveRecord::Migration
  def change
    rename_column(:link_subs, :links_id, :link_id)
    rename_column(:link_subs, :subs_id, :sub_id)
  end
end
