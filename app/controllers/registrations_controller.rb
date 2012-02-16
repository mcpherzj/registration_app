
class RegistrationsController < ApplicationController
  include RegistrationsHelper


  before_filter :authenticate, :only => [:new, :edit, :update, :create, :show, :index, :destroy]
 
  # once we allow users to look at and update their own registration data 
  # - we need to include the code below
  #before_filter :correct_user, :only => [:edit, :update]
  
  def export
  	require 'stringio'
  	
  	@excel_book = generate_spreadsheet
  	data = StringIO.new ''
  	@excel_book.write data
  	#require 'spreadsheet'
  	#headers['Content-Type'] = "application/vnd.ms-excel"    
  	#headers['Content-Disposition'] = 'attachment; filename="report.xls"'    
  	#headers['Cache-Control'] = ''    
  	
  	#@participants = Participant.all  
  	
  	#render :layout => 'non_application'  
  	#render :layout => false  
  	
    # Create workbook.
    t = Time.now
    file = "registration_data_" + t.strftime("%Y%m%d%H%M%S") + ".xls"  

    puts file

    #workbook = Excel.new("/reports/#{file}")  
	send_data(data.string, {
      :disposition => 'attachment',
      :encoding => 'utf8',
      :stream => false,
      :type => 'application/excel',
      :filename => "#{file}"})

    #redirect_to :action => 'index'  
  	
  end
  
  def export_emails
  	require 'stringio'
  	
  	@excel_book = generate_spreadsheet_of_emails
  	data = StringIO.new ''
  	@excel_book.write data
  	
    # Create workbook.
    t = Time.now
    file = "registration_emails_" + t.strftime("%Y%m%d%H%M%S") + ".xls"  

	  send_data(data.string, {
      :disposition => 'attachment',
      :encoding => 'utf8',
      :stream => false,
      :type => 'application/excel',
      :filename => "#{file}"})
  	
  end
  
  def export_parent_emails
  	require 'stringio'
  	
  	@excel_book = generate_spreadsheet_of_parent_emails
  	data = StringIO.new ''
  	@excel_book.write data
  	
    # Create workbook.
    t = Time.now
    file = "registration_emails_" + t.strftime("%Y%m%d%H%M%S") + ".xls"  

	  send_data(data.string, {
      :disposition => 'attachment',
      :encoding => 'utf8',
      :stream => false,
      :type => 'application/excel',
      :filename => "#{file}"})
  	
  end
  
  def export_athlete_emails
  	require 'stringio'
  	
  	@excel_book = generate_spreadsheet_of_athlete_emails
  	data = StringIO.new ''
  	@excel_book.write data
  	
    # Create workbook.
    t = Time.now
    file = "registration_emails_" + t.strftime("%Y%m%d%H%M%S") + ".xls"  

	  send_data(data.string, {
      :disposition => 'attachment',
      :encoding => 'utf8',
      :stream => false,
      :type => 'application/excel',
      :filename => "#{file}"})
  	
  end

  def copy
  	@registration = copy_registration(params[:id])
  	
  	render :action => "new"
  end
    
  def new
  	@title = "New Registration"
  	
  	#if (!params[:id].nil?)
  	#  @registration = copy_registration(params[:id])
	  #end
	  
	  if (@registration.nil?)
  	
  	  @registration = Registration.new
  	  @registration.participant = Participant.new
  	  #@registration.participant.build;
  	
  	  initialize_event_selections
  	  initialize_volunteer_selections
	  end
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
    #@registration.participant.attributes=(
    #		params[:registration][:participant_attributes])
    
    #set_date_of_birth(params[:registration][:participant_attributes])
    #update_event_selections(params[:registration][:event_selections_attributes])
    #update_volunteer_selections(params[:registration][:volunteer_selections_attributes])

    if @registration.update_attributes(params[:registration])
      redirect_to @registration, :notice => 'Registration was successfully updated.'
    else
      sort_event_selections
      sort_volunteer_selections
      render :action => "edit"
	  end
	
  end

  def create
  	@registration = Registration.new(params[:registration])
    #@participant = Participant.new(params[:registration][:participant_attributes])
    #@registration.participant = @participant

    set_date_of_birth(params[:registration][:participant_attributes])
    #set_event_selections(params[:registration][:event_selections_attributes])
    #set_volunteer_selections(params[:registration][:volunteer_selections_attributes])
    
	  if @registration.save
	    redirect_to @registration, :notice => 'Registration was successfully created.'
	  else
      sort_event_selections
      sort_volunteer_selections
	    render :action => "new"
	  end
  end

  def show
  	@title = "Registration Detail"
  	@registration = Registration.find(params[:id])
  	
    sort_event_selections
    sort_volunteer_selections

    # added for possible service
  	respond_to do |format|
  	  format.html
  	  format.xml { render :xml => @registration }	
  	  format.json { render :json => @registration.to_json }	
  	end
  end

  def index
  	@title = "Registrations Listing"
  	#@registrations = Registration.search(params[:search])
  	if (params[:season_id].nil?)
  	  params[:season_id] = Season.where(:active => true).first.id.to_s
	  end
  	#@registrations = Registration.all
  	@registrations = Registration.search(nil, nil, params[:season_id], nil)

    if (!@registrations.nil?)
      @registrations.sort!{ |a,b| [a.participant.last_name,a.participant.first_name] <=> [b.participant.last_name,b.participant.first_name] }
    end
  end

  def find
  	@title = "Find Registrations"
  	#@criteria = Criteria.new
  	#@criteria.first_name = 
  	#puts params[:search]

  	@registrations = Registration.search(params[:first_name], params[:last_name], params[:season_id], params[:email])

    if (!@registrations.nil?)
      @registrations.sort!{ |a,b| [a.participant.last_name,a.participant.first_name] <=> [b.participant.last_name,b.participant.first_name] }
    end
  end

  def destroy
  	@registration = Registration.find(params[:id])
  	
  	#if Registration.delete(@registration.id)
  	if delete_registration(@registration.id)
	    redirect_to registrations_path, :notice => 'Registration was successfully deleted.'
	  else
	    flash[:error] = 'Registration was NOT successfully deleted!'
	    redirect_to registrations_path
	  end  	
  end

private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    #@user = User.find(params[:id])
    #redirect_to(root_path) unless current_user?(@user)
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
