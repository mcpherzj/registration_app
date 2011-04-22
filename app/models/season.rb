class Season < ActiveRecord::Base
	attr_accessible(:year, :season_type_id, :active)
	
	validates(:year, 	:presence => true,
						:uniqueness => { :scope => :season_type_id })
	validates(:season_type_id, 	:presence => true)
	validates(:active, 	:presence => true)
end
