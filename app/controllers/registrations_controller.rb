
class RegistrationsController < ApplicationController

  def new
  	@title = "New Registration"
  	
  	@registration = Registration.new
  	@registration.participant = Participant.new
  	@registration.participant.build;
  	
  	initialize_event_selections
  	initialize_volunteer_selections 	
  end

  def edit
  	@title = "Registration Edit"
  	@registration = Registration.find(params[:id])
  	
  	add_to_event_selections_if_not_included
  	sort_event_selections

  	add_to_volunteer_selections_if_not_included
  	sort_volunteer_selections
  end

  def update
    @registration = Registration.find(params[:id])
    @registration.participant.attributes=(
    		params[:registration][:participant_attributes])
    set_date_of_birth(params[:registration][:participant_attributes])
    update_event_selections(params[:registration][:event_selections_attributes])
    update_volunteer_selections(params[:registration][:volunteer_selections_attributes])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to(@registration, :notice => 'Registration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
  	@registration = Registration.new(params[:registration])
    @participant = Participant.new(params[:registration][:participant_attributes])
    @registration.participant = @participant

    set_date_of_birth(params[:registration][:participant_attributes])
    set_event_selections(params[:registration][:event_selections_attributes])
    set_volunteer_selections(params[:registration][:volunteer_selections_attributes])
    
    respond_to do |format|
      if @registration.save
        format.html { redirect_to(@registration, :notice => 'Registration was successfully created.') }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
  	@title = "Registration Detail"
  	@registration = Registration.find(params[:id])
  end

  def index
  	@title = "Registrations Listing"
  	@registrations = Registration.all
  end

  def destroy
  end
  
  def set_date_of_birth(participant_attrs)
    year = participant_attrs["date_of_birth(1i)"]
    month = participant_attrs["date_of_birth(2i)"]
    day = participant_attrs["date_of_birth(3i)"]
    
    @registration.participant.validate_and_set_date_of_birth(year, month, day)
  end	

  def initialize_event_selections
    Event.where(:active => true).each do |event|
       es = EventSelection.new({:event => event, :event_id => event.id, :registration => @registration, :selected => false})
       @registration.event_selections << es
    end

	sort_event_selections
  end  	

  def initialize_volunteer_selections
    VolunteerInterest.where(:active => true).each do |vi|
       vs = VolunteerSelection.new({:volunteer_interest => vi, :volunteer_interest_id => vi.id, :registration => @registration, :selected => false})
       @registration.volunteer_selections << vs
    end

	sort_volunteer_selections
  end  	
  
  def set_event_selections(events_attrs)

    Event.where(:active => true).each do |event|
       es = EventSelection.new({:event => event, :event_id => event.id, :registration => @registration, :selected => false})
       @registration.event_selections << es
    end

    set_event_selections_to_selected(events_attrs)

  end
  
  def set_volunteer_selections(vis_attrs)

    VolunteerInterest.where(:active => true).each do |vi|
       vs = VolunteerSelection.new({:volunteer_interest => vi, :volunteer_interest_id => vi.id, :registration => @registration, :selected => false})
       @registration.volunteer_selections << vs
    end

    set_volunteer_selections_to_selected(vis_attrs)

  end
  
  def update_event_selections(events_attrs) 
  	
    events_attrs.each_value do |event_symbols|
      id = get_event_id(event_symbols)
      if (!id.nil?)
        event_selection = get_event_selection_by_event_id(id)
        
        if (!event_selection.nil?)
    	  event_selection.selected = is_selected?(event_symbols)
		end
	  end
	end
  end
  
  def update_volunteer_selections(vis_attrs) 
  	
    vis_attrs.each_value do |vi_symbols|
      id = get_volunteer_interest_id(vi_symbols)
      if (!id.nil?)
        volunteer_selection = get_volunteer_selection_by_volunteer_interest_id(id)
        
        if (!volunteer_selection.nil?)
    	  volunteer_selection.selected = is_selected?(vi_symbols)
		end
	  end
	end
  end

  def set_event_selections_to_selected(events_attrs)
  	
    events_attrs.each_value do |event_symbols|
      id = get_selected_event_id(event_symbols)
      if (!id.nil?)
        event_selection = get_event_selection_by_event_id(id)
        
        if (!event_selection.nil?)
    		event_selection.selected = true;
		end
	  end
	end
  end

  def set_volunteer_selections_to_selected(vis_attrs)
  	
    vis_attrs.each_value do |vi_symbols|
      id = get_selected_volunteer_interest_id(vi_symbols)
      if (!id.nil?)
        volunteer_selection = get_volunteer_selection_by_volunteer_interest_id(id)
        
        if (!volunteer_selection.nil?)
    		volunteer_selection.selected = true;
		end
	  end
	end
  end
  
  def get_event_id(symbol_container)
  	
  	idKey = symbol_container["event_id"]
  	    
	if (!idKey.nil?)
		return idKey.to_i
	end
	
 	return nil;
  end
  
  def get_volunteer_interest_id(symbol_container)
  	
  	idKey = symbol_container["volunteer_interest_id"]
  	    
	if (!idKey.nil?)
		return idKey.to_i
	end
	
 	return nil;
  end
  
  def is_selected?(symbol_container)
  	
  	selectedKey = symbol_container["selected"]
  	    
	if (selectedKey.to_i == 1)
		return true
	else
		return false
	end
  end
  
  def get_selected_event_id(symbol_container)
  	
  	idKey = symbol_container["event_id"]
  	selectedKey = symbol_container["selected"]
  	    
	if (!idKey.nil? && selectedKey.to_i == 1)
		return idKey.to_i
	end
	
 	return nil;
  end
  
  def get_selected_volunteer_interest_id(symbol_container)
  	
  	idKey = symbol_container["volunteer_interest_id"]
  	selectedKey = symbol_container["selected"]
  	    
	if (!idKey.nil? && selectedKey.to_i == 1)
		return idKey.to_i
	end
	
 	return nil;
  end
  
  def add_to_event_selections_if_not_included
    
    Event.where(:active => true).each do |event|
	  if (!@registration.events.include?(event))
       es = EventSelection.new({:event => event, :event_id => event.id, :registration => @registration, :selected => false})
       @registration.event_selections << es
      end
    end
  end
  
  def add_to_volunteer_selections_if_not_included
    
    VolunteerInterest.where(:active => true).each do |vi|
	  if (!@registration.volunteer_interests.include?(vi))
       vs = VolunteerSelection.new({:volunteer_interest => vi, :volunteer_interest_id => vi.id, :registration => @registration, :selected => false})
       @registration.volunteer_selections << vs
      end
    end
  end
  
  def get_event_selection_by_event_id(event_id)
    
    @registration.event_selections.each do |event_selection|
	  if (event_selection.event_id == event_id)	  	
	    return event_selection
      end
    end
    return nil
  end
  
  def get_volunteer_selection_by_volunteer_interest_id(volunteer_interest_id)
    
    @registration.volunteer_selections.each do |volunteer_selection|
	  if (volunteer_selection.volunteer_interest_id == volunteer_interest_id)	  	
	    return volunteer_selection
      end
    end
    return nil
  end
  
  def sort_event_selections
    if (!@registration.event_selections.nil?)
      @registration.event_selections.sort!{ |a,b| [b.gender_id,a.sort_order] <=> [a.gender_id,b.sort_order] }
    end
  end  	
  
  def sort_volunteer_selections
    if (!@registration.volunteer_selections.nil?)
    	@registration.volunteer_selections.sort!{ |a,b| [a.sort_order] <=> [b.sort_order] }
    end
  end  	

end
