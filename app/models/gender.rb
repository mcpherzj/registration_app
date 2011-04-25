class Gender < ActiveRecord::Base
	attr_accessible(:name)
	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
						
	def is_male?
		return id == 1
	end
						
	def is_female?
		return id == 2
	end
end
