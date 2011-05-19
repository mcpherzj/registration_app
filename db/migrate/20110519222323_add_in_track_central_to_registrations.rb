class AddInTrackCentralToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :in_track_central, :boolean, :default => false
  end

  def self.down
    remove_column :registrations, :in_track_central
  end
end
