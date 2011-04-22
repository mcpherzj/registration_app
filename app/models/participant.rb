class Participant < ActiveRecord::Base
	attr_accessible(:first_name, :last_name, :uniform_size_id, :shirt_size_id, :event_discipline_id)

	has_many :registrations
end
