class CreateVolunteerInterests < ActiveRecord::Migration
  def self.up
    create_table :volunteer_interests do |t|
      t.string :name
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :volunteer_interests
  end
end
