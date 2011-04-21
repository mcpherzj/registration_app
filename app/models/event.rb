class Event < ActiveRecord::Base
	attr_accessible(:name, :event_type_id, :active)
	belongs_to (:event_type)
	
	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
	validates(:event_type_id, 	:presence => true)
	validates(:active, 	:presence => true)
end
