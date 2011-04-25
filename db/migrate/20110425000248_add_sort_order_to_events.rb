class AddSortOrderToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :sort_order, :integer
  end

  def self.down
    remove_column :events, :sort_order
  end
end
