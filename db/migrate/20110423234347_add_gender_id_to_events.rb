class AddGenderIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :gender_id, :integer
  end

  def self.down
    remove_column :events, :gender_id
  end
end
