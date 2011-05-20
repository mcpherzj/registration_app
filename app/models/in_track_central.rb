class InTrackCentral
	attr_accessor(:id, :name)
	
	def initialize(id, name)
	  @id = id;
	  @name = name
	end
	
	def self.all
	  in_values = Array.new

	  in_values << InTrackCentral.new(true, "Yes")
	  in_values << InTrackCentral.new(false, "No")

      return in_values 
	end		

end
