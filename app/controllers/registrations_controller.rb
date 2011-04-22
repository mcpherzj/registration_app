class RegistrationsController < ApplicationController

  def new
  	@title = "Registration"
  	participant = Participant.new(:first_name => 'Jimmy')
  	@registration = Registration.new(:season_id => Season.find_by_year(2011).id, :participant => participant)
  	@registration.participant.build;
  end

  def edit
  	@title = "Registration Edit"
  	@registration = Registration.find(params[:id])
  end

  def update
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
