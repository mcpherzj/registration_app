class AddSelectedToVolunteerSelections < ActiveRecord::Migration
  def self.up
    add_column :volunteer_selections, :selected, :boolean
  end

  def self.down
    remove_column :volunteer_selections, :selected
  end
end
