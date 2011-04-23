class VolunteerSelection < ActiveRecord::Base
  attr_accessible(:volunteer_interest_id, :registration_id, :registration, :volunteer_interest, :selected)

  belongs_to :registration  
  belongs_to :volunteer_interest
end
