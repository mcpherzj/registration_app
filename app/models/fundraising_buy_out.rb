class FundraisingBuyOut
	attr_accessor(:id, :name)
	
	def initialize(id, name)
	  @id = id;
	  @name = name
	end
	
	def self.all
	  buy_outs = Array.new

	  buy_outs << FundraisingBuyOut.new(true, "Yes")
	  buy_outs << FundraisingBuyOut.new(false, "No")

      return buy_outs
	end		

end
