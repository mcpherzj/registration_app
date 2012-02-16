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
  
    #registrations = Registration.all
    registrations = Registration.search(params[:first_name], params[:last_name], params[:season_id], params[:email])
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
    worksheet.row(rownum).push "in_track_central"
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
      worksheet.row(rownum).push reg.in_track_central.nil? ? nil : reg.in_track_central ? "Yes" : "No"
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

  def generate_spreadsheet_of_emails
      
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
    
    worksheet = workbook.create_worksheet :name => "Emails"
    
    rownum = 0
    #worksheet.row(rownum).push "email"
    #worksheet.row(rownum).default_format = heading
    
    #seasonTypes = SeasonType.where(:name => "Track & Field")

    #if (seasonTypes == 0)
    #  return workbook
    #end

    #seasons = Season.where(:season_type_id => seasonTypes[0].id, :active => true)

    #if (seasons.count == 0)
    #  return workbook
    #end

    #regs = Registration.where(:season_id => seasons[0].id)
    regs = Registration.search(params[:first_name], params[:last_name], params[:season_id], params[:email])
    if (regs.count == 0)
      return workbook
    end

    emails = Array.new

    for reg in regs
      if (!reg.participant.preferred_parent_email.nil? and reg.participant.preferred_parent_email != "" and !emails.include?(reg.participant.preferred_parent_email))
        emails << reg.participant.preferred_parent_email
      end
    end  

    if (emails.count > 0)
         
      #Cycle through the emails 
      for email in emails

        email_str = email + ";"
        worksheet.row(rownum).push email_str
        #worksheet.row(rownum).default_format = data

        rownum += 1
      end
    
    end
  
    return workbook
  end  	


  def generate_spreadsheet_of_parent_emails
      
    workbook = Spreadsheet::Workbook.new
    
    worksheet = workbook.create_worksheet :name => "Emails"
    
    rownum = 0
    
    #seasonTypes = SeasonType.where(:name => "Track & Field")

    #if (seasonTypes == 0)
    #  return workbook
    #end

    #seasons = Season.where(:season_type_id => seasonTypes[0].id, :active => true)

    #if (seasons.count == 0)
    #  return workbook
    #end

    #regs = Registration.where(:season_id => seasons[0].id)
    regs = Registration.search(params[:first_name], params[:last_name], params[:season_id], params[:email])
    if (regs.count == 0)
      return workbook
    end

    emails = Array.new

    for reg in regs
      # try the father's email
      if (!reg.participant.fathers_email.nil? and reg.participant.fathers_email != "" and !emails.include?(reg.participant.fathers_email))
        emails << reg.participant.fathers_email
      end

      # try the mother's email
      if (!reg.participant.mothers_email.nil? and reg.participant.mothers_email != "" and !emails.include?(reg.participant.mothers_email))
        emails << reg.participant.mothers_email
      end
    end  

    if (emails.count > 0)
         
      #Cycle through the emails 
      for email in emails

        email_str = email + ";"
        worksheet.row(rownum).push email_str

        rownum += 1
      end
    
    end
  
    return workbook
  end

  def generate_spreadsheet_of_athlete_emails
      
    workbook = Spreadsheet::Workbook.new
    
    worksheet = workbook.create_worksheet :name => "Emails"
    
    rownum = 0
    
    #seasonTypes = SeasonType.where(:name => "Track & Field")

    #if (seasonTypes == 0)
    #  return workbook
    #end

    #seasons = Season.where(:season_type_id => seasonTypes[0].id, :active => true)

    #if (seasons.count == 0)
    #  return workbook
    #end

    #regs = Registration.where(:season_id => seasons[0].id)
    regs = Registration.search(params[:first_name], params[:last_name], params[:season_id], params[:email])
    if (regs.count == 0)
      return workbook
    end

    emails = Array.new

    for reg in regs
      # try the father's email
      if (!reg.participant.email.nil? and reg.participant.email != "" and !emails.include?(reg.participant.email))
        emails << reg.participant.email
      end
    end  

    if (emails.count > 0)
         
      #Cycle through the emails 
      for email in emails

        email_str = email + ";"
        worksheet.row(rownum).push email_str

        rownum += 1
      end
    
    end
  
    return workbook
  end

  def copy_registration(id)
    
  	reg = Registration.find(id)
  	reg_copy = nil;
  	
  	if (!reg.nil?)
  	  reg_copy = reg.clone
  	  reg_copy.participant = reg.participant.clone

  	  copy_event_selections(reg, reg_copy)
  	  copy_volunteer_selections(reg, reg_copy)
	  end
  	
  	return reg_copy
  	
  end

  def delete_registration(id)
    
  	reg = Registration.find(id)
  	
  	if (reg.nil?)
  	  return false
	  end
	  
	  part = reg.participant
	    
	  if (part.registrations.count == 1)
	    if !Participant.delete(part.id)
	      return false
      end
    end
    
    reg.event_selections.each do |es|
      if !EventSelection.delete(es.id)
        return false
      end
    end
    
    reg.volunteer_selections.each do |vs|
      if !VolunteerSelection.delete(vs.id)
        return false
      end
    end

    return Registration.delete(reg.id)
  	
  end
  
  def copy_event_selections(registration, reg_copy)
    
    registration.event_selections.each do |es|
      new_es = EventSelection.new({:event => es.event, :event_id => es.event_id, :registration => reg_copy, :selected => es.selected})
      reg_copy.event_selections << new_es
    end
    
    sort_registration_event_selections(reg_copy)
  end
  
  def copy_volunteer_selections(registration, reg_copy)
    
    registration.volunteer_selections.each do |vs|
       new_vs = VolunteerSelection.new({:volunteer_interest => vs.volunteer_interest, :volunteer_interest_id => vs.volunteer_interest_id, :registration => reg_copy, :selected => vs.selected})
       reg_copy.volunteer_selections << new_vs
    end
    
    sort_registration_volunteer_selections(reg_copy)
  end
  
  def sort_registration_event_selections (registration)
    if (!registration.event_selections.nil?)
      registration.event_selections.sort!{ |a,b| [b.gender_id,a.sort_order] <=> [a.gender_id,b.sort_order] }
    end
  end  	

  def sort_registration_volunteer_selections (registration)
    if (!registration.volunteer_selections.nil?)
    	registration.volunteer_selections.sort!{ |a,b| [a.sort_order] <=> [b.sort_order] }
    end
  end  	

end
