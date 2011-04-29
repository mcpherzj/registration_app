class Registration < ActiveRecord::Base
  attr_accessible(:participant, 
                  :season_id, 
                  :uniform_size_id, 
                  :shirt_size_id, 
                  :event_discipline_id, 
                  :maximum_updated_at,
                  :fundraising_buy_out,
                  :child_uniform_size_id)
  
  has_many :event_selections  
  has_many :events, :through => :event_selections
  
  has_many :volunteer_selections  
  has_many :volunteer_interests, :through => :volunteer_selections
  
  belongs_to :participant
  belongs_to :season
  belongs_to :uniform_size
  belongs_to :shirt_size
  belongs_to :event_discipline

  accepts_nested_attributes_for :participant
  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :event_selections
  accepts_nested_attributes_for :volunteer_selections

  validates(:participant, :presence => true)
  validates(:season, :presence => true)
  
  def maximum_updated_at
  	max = self[:updated_at]
  	
  	if (self.participant[:updated_at] > max)
  		max = self.participant[:updated_at]
  	end

  	return max
  end
  
  def fundraising_buy_out_options
  	options = Array.new
  	
  	
  end

end
