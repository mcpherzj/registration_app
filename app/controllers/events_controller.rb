class EventsController < ApplicationController
  def new
	@title = "New Event"  	
  	@event = Event.new
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def create
    @event = Event.new(params[:event])

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

end
