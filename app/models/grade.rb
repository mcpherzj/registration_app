class Grade
	attr_accessor(:name)
	
	def initialize(name)
	  @name = name
	end
	
	def self.all
	  grades = Array.new

	  grades << Grade.new("K")
		
	  for i in 1..12
        grades << Grade.new(i.to_s)
      end 

      return grades
	end		

end
