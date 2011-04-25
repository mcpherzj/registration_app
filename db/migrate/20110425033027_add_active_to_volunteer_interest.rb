class AddActiveToVolunteerInterest < ActiveRecord::Migration
  def self.up
    add_column :volunteer_interests, :active, :boolean
  end

  def self.down
    remove_column :volunteer_interests, :active
  end
end
