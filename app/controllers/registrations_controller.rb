
class RegistrationsController < ApplicationController

  def new
  	@title = "New Registration"
  	
  	@registration = Registration.new
  	@registration.participant = Participant.new
  	@registration.participant.build;
    
    Event.where(:active => true).each do |event|
       es = EventSelection.new({:event => event, :event_id => event.id, :registration => @registration, :selected => false})
       @registration.event_selections << es
    end
  end

  def edit
  	@title = "Registration Edit"
  	@registration = Registration.find(params[:id])
  	
  	add_to_event_selections_if_not_included
  end

  def update
    @registration = Registration.find(params[:id])
    @registration.participant.attributes=(
    		params[:registration][:participant_attributes])
    set_event_selections_to_selected(params[:registration][:event_selections_attributes])

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
    set_event_selections(params[:registration][:event_selections_attributes])
    
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
  
  def set_event_selections(events_attrs)

#    events_attrs.each_value do |event_symbols|
#    	id = get_id(event_symbols)
#    	if (!id.nil?)
#    	  event = Event.find_by_id(id)
#          es = EventSelection.new({:event => event, :registration => @registration, :selected => false})
#          @registration.event_selections << es
#	    end
#	end
    
    Event.where(:active => true).each do |event|
       es = EventSelection.new({:event => event, :event_id => event.id, :registration => @registration, :selected => false})
       @registration.event_selections << es
    end

    set_event_selections_to_selected(events_attrs)

  end

  def set_event_selections_to_selected(events_attrs)
  	
    events_attrs.each_value do |event_symbols|
      id = get_selected_id(event_symbols)
      if (!id.nil?)
        event_selection = get_event_selection_by_event_id(id)
        
        if (!event_selection.nil?)
    		event_selection.selected = true;
		end
	  end
	end
  end
  
  def get_id(symbol_container)
  	
  	idKey = symbol_container["event_id"]
  	    
	if (!idKey.nil?)
		return idKey
	end
	
 	return nil;
  end
  
  def get_selected_id(symbol_container)
  	
  	idKey = symbol_container["event_id"]
  	#puts "id value: " + idKey + " class: " + idKey.class.to_s
  	selectedKey = symbol_container["selected"]
  	#puts "selected value: " + selectedKey + " class: " + selectedKey.class.to_s
  	    
	if (!idKey.nil? && selectedKey.to_i == 1)
		puts "found selected key " + idKey.to_s
		return idKey
	end
	
 	return nil;
  end
  
  def add_to_event_selections_if_not_included
    
    Event.where(:active => true).each do |event|
	  if (!@registration.events.include?(event))
	    @registration.events << event
      end
    end
  end
  
  def get_event_selection_by_event_id(event_id)
    
    @registration.event_selections.each do |event_selection|
	  if (event_selection.event_id == event_id.to_i)	  	
	    return event_selection
      end
    end
    return nil
  end

end
