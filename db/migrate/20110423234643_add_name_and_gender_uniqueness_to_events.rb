class AddNameAndGenderUniquenessToEvents < ActiveRecord::Migration
  def self.up
  	add_index :events, [:name, :gender_id], :unique => true
  end

  def self.down
  	remove_index :events, [:name, :gender_id]
  end
end
