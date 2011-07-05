class UsersController < ApplicationController

  def new
  	@user = User.new
  	@title = "Sign Up"
  end

  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Account created successfully!" #when redirecting use flash
  		redirect_to user_path(@user)
  	else
  		@title = "Sign Up"
  		@user.password = "" #reset password
  		@user.password_confirmation = ""
  		render 'new'
  	end
  end

end
