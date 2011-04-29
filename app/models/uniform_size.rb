class UniformSize < ActiveRecord::Base
	attr_accessible(:name, :sort_order)
	validates(:name, 	:presence => true,
						:length => { :maximum => 100 },
						:uniqueness => { :case_sensitive => false })
						
	def self.adult_uniform_sizes
		
	  adult_sizes = Array.new
	  
	  blank = UniformSize.new
	  blank.id = nil
	  blank.name = ""
	  blank.sort_order = 0
	  
	  adult_sizes << blank
	  
	  UniformSize.where("name LIKE 'Adult%'").each do |uniform_size|
	  	adult_sizes << uniform_size
      end
		
	  return adult_sizes     
	end
						
	def self.child_uniform_sizes
		
	  child_sizes = Array.new
	  
	  blank = UniformSize.new
	  blank.id = nil
	  blank.name = ""
	  blank.sort_order = 0
	  
	  child_sizes << blank
	  
	  UniformSize.where("name NOT LIKE 'Adult%'").each do |uniform_size|
	  	child_sizes << uniform_size
      end
		
	  return child_sizes     
	end

end
