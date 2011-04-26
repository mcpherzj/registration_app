class Participant < ActiveRecord::Base
	#attr_accessor(:date_of_birth)
	attr_accessible(:first_name, 
					:last_name,
					:street_address,
					:city,
					:state,
					:zip,
					:subdivision,
					:school,
					:grade,
					:date_of_birth,
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
				    :gender_id,
				    :parent_legal_guardian)

	has_many :registrations
	
  validates(:first_name, :presence => true,
  						 :length => { :maximum => 50 })
  validates(:last_name, :presence => true,
  						:length => { :maximum => 50 })
  validates(:zip, :length => { :maximum => 10 })
  validates(:date_of_birth, :presence => true)
  
  validates(:street_address, :length => { :maximum => 75 })
  validates(:city, :length => { :maximum => 50 })
  validates(:state, :length => { :maximum => 2 })
  validates(:subdivision, :length => { :maximum => 50 })
  validates(:school, :length => { :maximum => 50 })
  validates(:grade, :length => { :maximum => 2 })
  validates(:home_phone, :length => { :maximum => 25 })
  validates(:cell_phone, :length => { :maximum => 25 })
  validates(:fathers_work_phone, :length => { :maximum => 25 })
  validates(:fathers_cell_phone, :length => { :maximum => 25 })
  validates(:mothers_work_phone, :length => { :maximum => 25 })
  validates(:mothers_cell_phone, :length => { :maximum => 25 })
  validates(:nearest_relative_phone, :length => { :maximum => 25 })
  validates(:emergency_contact_phone, :length => { :maximum => 25 })
  validates(:email, :length => { :maximum => 50 })
  validates(:preferred_parent_email, :length => { :maximum => 50 })
  validates(:fathers_email, :length => { :maximum => 50 })
  validates(:mothers_email, :length => { :maximum => 50 })
  validates(:fathers_name, :length => { :maximum => 60 })
  validates(:mothers_name, :length => { :maximum => 60 })
  validates(:nearest_relative_name, :length => { :maximum => 60 })
  validates(:emergency_contact_name, :length => { :maximum => 60 })
  validates(:medical_insurance_company, :length => { :maximum => 60 })
  validates(:name_of_insured, :length => { :maximum => 60 })
  validates(:parent_legal_guardian, :length => { :maximum => 60 })
  validates(:policy_or_group_number, :length => { :maximum => 25 })
  validates(:medical_insurance_id_number, :length => { :maximum => 25 })
  
  validate :date_of_birth_is_valid_date
  
  def date_of_birth_is_valid_date
  	if (!@date_of_birth_string.nil?)
  	  errors.add(:date_of_birth, 'must be a valid datetime') if ((DateTime.parse(@date_of_birth_string) rescue ArgumentError) == ArgumentError)
  	end
  end 
  
  def validate_and_set_date_of_birth(year, month, day_of_month)
  	@date_of_birth_string = year + "-" + month + "-" + day_of_month
  	if ((Date.parse(@date_of_birth_string) rescue ArgumentError) == ArgumentError)
  	  # do nothing if date argument is invalid
  	else
  	  self[:date_of_birth] = Date.parse(@date_of_birth_string)
  	end
  end 	
end
