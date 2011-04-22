class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.references :participant
      t.integer :season_id
      t.integer :uniform_size_id
      t.integer :shirt_size_id
      t.integer :event_discipline_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
