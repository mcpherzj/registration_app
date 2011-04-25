class SessionsController < ApplicationController
	
  def new
  	@title = "Sign up"
  end
  
  def create
  	render 'new'
  end
  
  def destroy
  end

end
