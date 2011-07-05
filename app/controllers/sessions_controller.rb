class SessionsController < ApplicationController

  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(params[:session][:email],
  	                         params[:session][:password])
  	if user.nil? #error message render sign in form
  		flash.now[:error] = "Invalid email/password combination." #when rendering use flash.now
  		@title = "Sign in"
  		render 'new' 		
  	else #sign in user redirect to user's show page
  		sign_in user
  		redirect_to user
  	end
  end

  def destroy
  end

end
