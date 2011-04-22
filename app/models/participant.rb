class Participant < ActiveRecord::Base
	attr_accessible(:first_name, 
					:last_name,
					:street_address,
					:city,
					:state,
					:zip,
					:subdivision,
					:school,
					:grade,
					:date_of_brith,
					:home_phone,
					:cell_phone,
				    :email,
				    :preferred_parent_email,
				    :fathers_name,
				    :fathers_work_phone,
				    :fathers_cell_phone,
				    :fathers_email,
				    :mothers_name,
				    :mothers_work_phone,
				    :mothers_cell_phone,
				    :mothers_email,
				    :nearest_relative_name,
				    :nearest_relative_phone,
				    :special_precautions,
				    :emergency_contact_name,
				    :emergency_contact_phone,
				    :medication_in_athletes_possession,
				    :pertinent_medical_history,
				    :medical_insurance_company,
				    :name_of_insured,
				    :policy_or_group_number,
				    :medical_insurance_id_number,
				    :gender_id)

	has_many :registrations
	
  validates(:first_name, :presence => true)
  validates(:last_name, :presence => true)
  validates(:zip, :length => { :maximum => 10 })
	
end
