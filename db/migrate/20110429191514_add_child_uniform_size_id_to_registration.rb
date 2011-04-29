class AddChildUniformSizeIdToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :child_uniform_size_id, :integer
  end

  def self.down
    remove_column :registrations, :child_uniform_size_id
  end
end
