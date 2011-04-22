class CreateVolunteerSelections < ActiveRecord::Migration
  def self.up
    create_table :volunteer_selections do |t|
      t.integer :registration_id
      t.integer :volunter_interest_id

      t.timestamps
    end
  end

  def self.down
    drop_table :volunteer_selections
  end
end
