class AddNameUniquenessIndexToEventTypes < ActiveRecord::Migration
  def self.up
  	add_index :event_types, :name, :unique => true
  end

  def self.down
  	remove_index :event_types, :name
  end
end
