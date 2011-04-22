class CreateEventDisciplines < ActiveRecord::Migration
  def self.up
    create_table :event_disciplines do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :event_disciplines
  end
end
