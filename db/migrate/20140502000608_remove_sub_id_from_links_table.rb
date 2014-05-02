class RemoveSubIdFromLinksTable < ActiveRecord::Migration
  def change
    remove_column(:links, :sub_id, :integer)
  end
end
