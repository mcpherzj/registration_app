class VolunteerSelection < ActiveRecord::Base
  attr_accessible(:volunteer_interest_id, :registration_id, :registration, :volunteer_interest, :selected)

  belongs_to :registration  
  belongs_to :volunteer_interest
  
  def name
    volunteer_interest.name	
  end
  
  def sort_order
    volunteer_interest.sort_order	
  end
  
end
