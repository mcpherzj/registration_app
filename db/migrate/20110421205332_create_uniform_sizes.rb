class CreateUniformSizes < ActiveRecord::Migration
  def self.up
    create_table :uniform_sizes do |t|
      t.string :name
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :uniform_sizes
  end
end
