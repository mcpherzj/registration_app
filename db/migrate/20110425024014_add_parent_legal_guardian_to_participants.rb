class AddParentLegalGuardianToParticipants < ActiveRecord::Migration
  def self.up
    add_column :participants, :parent_legal_guardian, :string
  end

  def self.down
    remove_column :participants, :parent_legal_guardian
  end
end
