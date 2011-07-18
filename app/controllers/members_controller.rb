class MembersController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => [:destroy, :edit, :update] #check if user owns the members being modified

	def index
		@title = "Family Members"
		@user = current_user
		@members = current_user.members
	end

	def create
		@member = current_user.members.build(params[:member])
		if @member.save
      		flash[:success] = "Family Member created!"
      	else
      		flash[:failed] = "Failed to create Family Member!"
      	end
      	redirect_to members_path
	end

  	def new
    	@member = Member.new if signed_in?
    	@title = "Create new Family Member"
  	end

  	def edit
  		@title = "Edit Family Member"
  	end

  	def update
  		if @member.update_attributes(params[:member])
      		flash[:success] = "Family Member updated."
      		redirect_to members_path
    	else
    		flash[:failed] = "Failed to modify Family Member."
      		render 'edit'
    	end
  	end

  	def destroy
    	@member.destroy
    	flash[:success] = "The following Family Member was removed: #{@member.name}."
    	redirect_back_or members_path
   end

  		private
  	
    def authorized_user
      @member = current_user.members.find_by_id(params[:id])
      redirect_to root_path if @member.nil?
  	end
end
