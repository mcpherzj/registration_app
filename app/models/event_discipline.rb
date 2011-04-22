class EventDiscipline < ActiveRecord::Base
	attr_accessible(:name)
	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
end
