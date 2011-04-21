class EventType < ActiveRecord::Base
	attr_accessible(:name)
	has_many :events
	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
end
