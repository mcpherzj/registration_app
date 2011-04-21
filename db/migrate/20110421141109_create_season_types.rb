class CreateSeasonTypes < ActiveRecord::Migration
  def self.up
    create_table :season_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :season_types
  end
end
