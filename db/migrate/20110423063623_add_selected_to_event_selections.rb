class AddSelectedToEventSelections < ActiveRecord::Migration
  def self.up
    add_column :event_selections, :selected, :boolean
  end

  def self.down
    remove_column :event_selections, :selected
  end
end
