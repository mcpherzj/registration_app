class Event < ActiveRecord::Base
	attr_accessible(:name)
	belongs_to (:event_type)
	
	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
end
