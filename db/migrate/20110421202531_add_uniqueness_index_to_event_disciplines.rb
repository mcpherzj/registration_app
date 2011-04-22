class AddUniquenessIndexToEventDisciplines < ActiveRecord::Migration
  def self.up
  	add_index :event_disciplines, :name, :unique => true
  end

  def self.down
  	remove_index :event_disciplines, :name
  end
end
