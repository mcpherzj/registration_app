class AddNameUniquenessIndexToGenders < ActiveRecord::Migration
  def self.up
  	add_index :genders, :name, :unique => true
  end

  def self.down
  	remove_index :genders, :name
  end
end
