class EventSelection < ActiveRecord::Base
  #attr_accessor(:selected)
  attr_accessible(:event_id, :registration_id, :registration, :event, :selected)

  belongs_to :registration  
  belongs_to :event
  
  #def initialize     
  #	@selected = false
  #end
 
  #def selected?
  #	@selected
  #end  
  
  def name
    event.name	
  end
  
  def gender_id
    event.gender_id	
  end
  
  def sort_order
    event.sort_order	
  end
  	
end
