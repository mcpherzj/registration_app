class Registration < ActiveRecord::Base
  attr_accessible(:participant, :season_id, :uniform_size_id, :shirt_size_id, :event_discipline_id)
  
  has_many :event_selections  
  has_many :events, :through => :event_selections
  
  has_many :volunteer_selections  
  has_many :volunteer_interests, :through => :volunteer_selections
  
  belongs_to :participant
  belongs_to :season

  accepts_nested_attributes_for :participant
  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :event_selections

  validates(:participant, :presence => true)

end
