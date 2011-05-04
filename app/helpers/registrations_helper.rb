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

  def generate_spreadsheet
      
    workbook = Spreadsheet::Workbook.new
  
    heading = Spreadsheet::Format.new(  
       :color => "black",  
       :bold => true,
       :underline => false,
       :pattern => 1,
       :pattern_fg_color => "yellow",
       :border => [true, true, true, true] 
    )  
  
    data = Spreadsheet::Format.new(  
       :color     => "black",  
       :bold      => false,
       :underline => false,
       :border => [true, true, true, true] 
    )  
  
    workbook.add_format(heading)  
    workbook.add_format(data)  
    
    worksheet = workbook.create_worksheet :name => "Registrations"
  
    registrations = Registration.all
    if (registrations.count > 0)
      participant_order = [ "id", 
                            "first_name", 
                            "last_name", 
                            "street_address", 
                            "city",
                            "state",
                            "zip",
                            "subdivision",
                            "school",
                            "grade",
                            "date_of_birth",
                            "home_phone",
                            "cell_phone",
                            "email",
                            "preferred_parent_email",
                            "fathers_name",                      
		                    "fathers_work_phone",
		 			        "fathers_cell_phone",
					        "fathers_email",
					        "mothers_name",
					        "mothers_work_phone",
					        "mothers_cell_phone",
					        "mothers_email",
					        "nearest_relative_name",
					        "nearest_relative_phone",
					        "special_precautions",
					        "emergency_contact_name",
					        "parent_legal_guardian",
					        "emergency_contact_phone",
					        "medication_in_athletes_possession",
					        "pertinent_medical_history",
					        "medical_insurance_company",
					        "name_of_insured",
					        "policy_or_group_number",
					        "medical_insurance_id_number"]
    
    rownum = 0
    worksheet.row(rownum).push "created_date"
    worksheet.row(rownum).default_format = heading
    worksheet.row(rownum).push "modified_date"
    worksheet.row(rownum).default_format = heading
    
    for part in participant_order
      worksheet.row(rownum).push part
      worksheet.row(rownum).default_format = heading
    end

    worksheet.row(rownum).push "gender"
    worksheet.row(rownum).default_format = heading
    worksheet.row(rownum).push "child_uniform_size"
    worksheet.row(rownum).default_format = heading
    worksheet.row(rownum).push "uniform_size"
    worksheet.row(rownum).default_format = heading
    worksheet.row(rownum).push "t_shirt_size"
    worksheet.row(rownum).default_format = heading
    worksheet.row(rownum).push "event_discipline"
    worksheet.row(rownum).default_format = heading
    worksheet.row(rownum).push "fundraising_buy_out"
    worksheet.row(rownum).default_format = heading
    
    events = Event.all.sort{ |a,b| [b.gender_id,a.sort_order] <=> [a.gender_id,b.sort_order] }
      
    for event in events
      worksheet.row(rownum).push event.gender.is_male? ? "boys"+ "_" + event.name : "girls" + "_" + event.name
      worksheet.row(rownum).default_format = heading
  	end
      
    interests = VolunteerInterest.all.sort{ |a,b| [a.sort_order] <=> [b.sort_order] }
      
    for interest in interests
      worksheet.row(rownum).push interest.name
      worksheet.row(rownum).default_format = heading
  	end
     
    #Cycle through the registrations 
    for reg in registrations
      rownum += 1

      worksheet.row(rownum).push reg.created_at.localtime.strftime("%m-%d-%Y %H:%M:%S")
      worksheet.row(rownum).default_format = data
      worksheet.row(rownum).push reg.maximum_updated_at.localtime.strftime("%m-%d-%Y %H:%M:%S")
      worksheet.row(rownum).default_format = data

      for column in participant_order
        #worksheet.row(rownum).push reg.participant[column].nil? ? 'N/A' : reg.participant[column]
        if (column == "date_of_birth")
          worksheet.row(rownum).push reg.participant[column].strftime("%m-%d-%Y")          
    	else
          worksheet.row(rownum).push reg.participant[column]
        end
        worksheet.row(rownum).default_format = data
      end

      worksheet.row(rownum).push reg.participant.gender_id.nil? ? nil : reg.participant.gender.name
      worksheet.row(rownum).default_format = data
      worksheet.row(rownum).push reg.child_uniform_size_id.nil? ? nil : 
        UniformSize.find_by_id(reg.child_uniform_size_id).name
      worksheet.row(rownum).default_format = data
      worksheet.row(rownum).push reg.uniform_size_id.nil? ? nil : reg.uniform_size.name
      worksheet.row(rownum).default_format = data
      worksheet.row(rownum).push reg.shirt_size_id.nil? ? nil : reg.shirt_size.name
      worksheet.row(rownum).default_format = data
      worksheet.row(rownum).push reg.event_discipline_id.nil? ? nil : reg.event_discipline.name
      worksheet.row(rownum).default_format = data
      worksheet.row(rownum).push reg.fundraising_buy_out.nil? ? nil : reg.fundraising_buy_out ? "Yes" : "No"
      worksheet.row(rownum).default_format = data

      reg.event_selections.sort!{ |a,b| [b.gender_id,a.sort_order] <=> [a.gender_id,b.sort_order] }
      
      for event_selection in reg.event_selections
        worksheet.row(rownum).push event_selection.selected ? "Yes" : nil
        worksheet.row(rownum).default_format = data
  	  end
      
      reg.volunteer_selections.sort!{ |a,b| [a.sort_order] <=> [b.sort_order] }
      
      for vol_selection in reg.volunteer_selections
        worksheet.row(rownum).push vol_selection.selected ? "Yes" : nil
        worksheet.row(rownum).default_format = data
  	  end
    end
    
    #loop = 0
    #for col_name in column_order
    #	col = worksheet.column(loop)
    #	col.width = 40
    #	loop += 1
	#end
    end
  
    return workbook
  end  	

end
