class EventsController < ApplicationController
  before_filter :authenticate, :only => [:new, :edit, :update, :create, :show, :index, :destroy]

  def new
	@title = "New Event"  	
  	@event = Event.new(:active => true)
  end

  def show
  	@title = "Event Detail"
  	@event = Event.find(params[:id])
  end

  def index
  	@title = "Listing Events"
  	@events = Event.all
  end

  def edit
  end

  def update
  end

  def create
  	@event = Event.new(params[:event])
    #@event_type = EventType.find(params[:event_type_id])     
    #@event = @event_type.events.create(params[:event]) 
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  end

private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    #@user = User.find(params[:id])
    #redirect_to(root_path) unless current_user?(@user)
  end

end
