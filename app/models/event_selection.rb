class EventSelection < ActiveRecord::Base
  #attr_accessor(:selected?)
  attr_accessible(:event_id, :registration_id, :registration, :event)

  belongs_to :registration  
  belongs_to :event
  
  #def initialize     
  #	@selected = false
  #end
 
  #def selected?
  #	@selected
  #end  
  	
end
