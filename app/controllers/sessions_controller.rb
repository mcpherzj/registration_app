class SessionsController < ApplicationController
	
  def new
  	@title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      # Create an error message and re-render the signin form.
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render :action => "new"
    else
      # Sign the user in and redirect to the home page.
      flash[:notice] = "You have signed in successfully"
      sign_in user
      #redirect_to registrations_path
      redirect_back_or root_path
    end    
  end
  
  def destroy
    flash[:notice] = "You are now signed out."
    sign_out
    redirect_to root_path
  end
end
