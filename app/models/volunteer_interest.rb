class VolunteerInterest < ActiveRecord::Base
	attr_accessible(:name, :sort_order, :active)

	has_many :volunteer_selections  
	has_many :registrations, :through => :volunteer_selections	

	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
end
