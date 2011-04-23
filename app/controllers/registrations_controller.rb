
class RegistrationsController < ApplicationController

  def new
  	@title = "New Registration"
  	
  	@registration = Registration.new
  	@registration.participant = Participant.new
  	@registration.participant.build;
    
    Event.where(:active => true).each do |event|
       #event.selected? = false
       @registration.events << event
    end
  end

  def edit
  	@title = "Registration Edit"
  	@registration = Registration.find(params[:id])
  	
  	set_event_selections
  end

  def update
    @registration = Registration.find(params[:id])
    @registration.participant.attributes=(
    		params[:registration][:participant_attributes])
    update_event_selections(params[:registration][:events_attributes])

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
    update_event_selections(params[:registration][:events_attributes])
    
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
  
  def update_event_selections(events_attrs)

    events_attrs.each_value do |event_symbols|
    	id = get_selected_ids(event_symbols)
    	if (!id.nil?)
    	  event = Event.find(id)
		  #puts "found a selected id: " + id.to_s
    	  @registration.events << event
	    end
	end
  	
	#return events
  end
  
  def get_selected_ids(symbol_container)
  	
  	idKey = symbol_container["id"]
  	#puts "id value: " + idKey + " class: " + idKey.class.to_s
  	selectedKey = symbol_container["selected"]
  	#puts "selected value: " + selectedKey + " class: " + selectedKey.class.to_s
  	    
	if (!idKey.nil? && selectedKey.to_i == 1)
		#puts "found selected key " + idKey.to_s
		return idKey
	end
	
 	return nil;
  end
  
  def set_event_selections
    events = Array.new;
    
    Event.where(:active => true).each do |event|
	  if (!@registration.events.nil? && @registration.events.include?(event))
	    event.selected = true
      end
      events << event
    end
        
    @registration.events = events 	
  end

end
