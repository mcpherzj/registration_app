class Season < ActiveRecord::Base
	attr_accessible(:year, :season_type_id, :active, :name)
	belongs_to :season_type
	
	validates(:year, 	:presence => true,
						:uniqueness => { :scope => :season_type_id })
	validates(:season_type_id, 	:presence => true)
	validates(:active, :inclusion => { :in => [true, false] })
	
	def name
		year.to_s + " " + season_type.name
	end
end
