class Participant < ActiveRecord::Base
	has_many :registrations
end
