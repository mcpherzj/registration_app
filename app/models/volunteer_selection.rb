class VolunteerSelection < ActiveRecord::Base
  belongs_to :registration  
  belongs_to :volunteer_interest
end
