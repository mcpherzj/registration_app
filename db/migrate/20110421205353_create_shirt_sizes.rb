class CreateShirtSizes < ActiveRecord::Migration
  def self.up
    create_table :shirt_sizes do |t|
      t.string :name
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :shirt_sizes
  end
end
