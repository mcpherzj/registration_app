class Event < ActiveRecord::Base
	attr_accessor(:selected)
	attr_accessible(:name, :event_type_id, :active, :gender_id, :event_type, :selected, :sort_order)
	belongs_to (:event_type)
	belongs_to (:gender)
  
	has_many :event_selections  
	has_many :registrations, :through => :event_selections	
	
    validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :scope => :gender_id })
	validates(:event_type_id, 	:presence => true)
	validates(:active, 	:presence => true)
	validates(:gender_id, 	:presence => true)
end
