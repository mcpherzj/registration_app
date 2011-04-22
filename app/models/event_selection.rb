class EventSelection < ActiveRecord::Base
  belongs_to :registration  
  belongs_to :event
end
