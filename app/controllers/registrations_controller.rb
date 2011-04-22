class RegistrationsController < ApplicationController

  def new
  	@title = "New Registration"
  	
  	@registration = Registration.new
  	@registration.participant = Participant.new
  	@registration.participant.build;
  end

  def edit
  	@title = "Registration Edit"
  	@registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    @registration.participant.attributes=(
    		params[:registration][:participant_attributes])

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

end
