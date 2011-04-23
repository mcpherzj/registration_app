module RegistrationsHelper


  def new_event_selections
  end
  
  def get_selected_id(symbol_container)
  	
  	    symbol_container.each_key do |key| 
  	    	if (key.to_s == "id")
  	    		puts "has_key: " + symbol_container.has_key("selected").to_s
  	    		return symbol_container[key]
  	    	end
  	    end
	
  	    return nil;
  end

end
