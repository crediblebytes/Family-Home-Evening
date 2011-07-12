class LessonsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]








  def new
    @user = User.new
    @title = "Sign Up"
  end

  def index
    @title = "All lessons"
    @user = current_user
    @lessons = @user.lessons.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @lessons = @user.lessons.paginate(:page => params[:page])
    @title = @user.name
  end








  def create
    @lesson  = current_user.lessons.build(params[:lesson])
    if @lesson.save
      flash[:success] = "Lesson created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end

end
