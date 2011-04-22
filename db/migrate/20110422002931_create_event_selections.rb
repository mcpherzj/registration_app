class CreateEventSelections < ActiveRecord::Migration
  def self.up
    create_table :event_selections do |t|
      t.integer :registration_id
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :event_selections
  end
end
