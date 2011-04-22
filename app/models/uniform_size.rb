class UniformSize < ActiveRecord::Base
	attr_accessible(:name, :sort_order)
	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
end
