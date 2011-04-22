class Registration < ActiveRecord::Base
  attr_accessible(:season_id, :uniform_size_id, :shirt_size_id, :event_discipline_id)
  
  has_many :event_selections  
  has_many :events, :through => :event_selections
  
  has_many :volunteer_selections  
  has_many :volunteer_interests, :through => :volunteer_selections
  
  belongs_to :participant
  belongs_to :season
end
