class Registration < ActiveRecord::Base
  attr_accessible(:participant, 
                  :season_id, 
                  :uniform_size_id, 
                  :shirt_size_id, 
                  :event_discipline_id, 
                  :maximum_updated_at,
                  :fundraising_buy_out,
                  :child_uniform_size_id,
                  :in_track_central)
  
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
  
  def self.search(first_name, last_name, season_id, email)
    return [] if first_name.blank? and last_name.blank? and season_id.blank? and email.blank?
    
    join_string = "INNER JOIN participants ON participants.id = registrations.participant_id"

    if !email.blank?
      join_string = join_string + " AND ( participants.email = '" + email + "'" + \
        " OR participants.preferred_parent_email = '" + email + "'" + \
        " OR participants.fathers_email = '" + email + "'" + \
        " OR participants.mothers_email = '" + email + "' )"
    end

    if !season_id.blank?
      join_string = join_string + " AND registrations.season_id = " + season_id
    end
    
    if !first_name.blank?
      join_string = join_string + " AND participants.first_name like '%" + first_name + "%'"
    end
    
    if !last_name.blank?
      join_string = join_string + " AND participants.last_name like '%" + last_name + "%'"
    end
    return Registration.all(:joins => join_string)
  end

end
