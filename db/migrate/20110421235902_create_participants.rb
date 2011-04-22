class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :subdivision
      t.string :school
      t.string :grade
      t.date :date_of_birth
      t.string :home_phone
      t.string :cell_phone
      t.string :email
      t.string :preferred_parent_email
      t.string :fathers_name
      t.string :fathers_work_phone
      t.string :fathers_cell_phone
      t.string :fathers_email
      t.string :mothers_name
      t.string :mothers_work_phone
      t.string :mothers_cell_phone
      t.string :mothers_email
      t.string :nearest_relative_name
      t.string :nearest_relative_phone
      t.text :special_precautions
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.text :medication_in_athletes_possession
      t.text :pertinent_medical_history
      t.string :medical_insurance_company
      t.string :name_of_insured
      t.string :policy_or_group_number
      t.string :medical_insurance_id_number
      t.integer :gender_id

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
