class LessonsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => [:destroy, :edit, :update]
  uses_tiny_mce(:only => [:new, :create, :edit, :update],
                :options => {
                  :theme => 'advanced',
                  :browsers => %w{msie gecko},
                  :theme_advanced_toolbar_location => "top",
                  :theme_advanced_toolbar_align => "left",
                  :theme_advanced_resizing => true,
                  :theme_advanced_resize_horizontal => false,
                  :paste_auto_cleanup_on_paste => true,
                  :theme_advanced_buttons1 => %w{formatselect fontselect fontsizeselect bold italic underline strikethrough separator justifyleft justifycenter justifyright indent outdent },
                  :theme_advanced_buttons2 => %w{bullist numlist forecolor backcolor separator link unlink image media undo redo},
                  :theme_advanced_buttons3 => [],
                  :plugins => %w{style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template wordcount advlist autosave}
                })
  


  def new
    @lesson = Lesson.new if signed_in?
    @title = "Create new lesson"
    unless params[:id].nil? 
      #add a public lesson and make private
      public_lesson = Lesson.find(params[:id])
      @lesson = public_lesson.clone
      @lesson.user_id = current_user
      @lesson.private = true
      @title = "Add public lesson"
    end
    
  end

  def index
    @title = "All lessons"
    @user = current_user
    @lessons = @user.lessons.paginate(:page => params[:page])
    @public_lessons = Lesson.find(:all, :conditions => ["private = ? ", false])
  end

  def show
    @user = current_user
    @lesson = Lesson.find(params[:id])
    @title = @user.name
  end

  def create
    @lesson  = current_user.lessons.build(params[:lesson])
    if @lesson.save
      flash[:success] = "Lesson created!"
      redirect_to lessons_path
    else
      render 'lessons/new'
    end
  end

  def edit
    @title = "Edit Lesson"
  end

  def update
    if @lesson.update_attributes(params[:lesson])
      flash[:success] = "Lesson updated."
      redirect_to lessons_path
    else
      @title = "Edit Lesson"
      render 'edit'
    end
  end

  def destroy
    @lesson.destroy
    flash[:success] = "The lesson: #{@lesson.title} was deleted."
    redirect_back_or lessons_path
  end

    private

  def authorized_user
      @lesson = current_user.lessons.find_by_id(params[:id])
      redirect_to root_path if @lesson.nil?
  end


end
