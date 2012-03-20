class CoursesController < ApplicationController
  before_filter :login_required
  before_filter :find_course, :only => [:show, :edit, :update, :destroy]
  filter_access_to :all
  
  def index
    @courses = Course.active
  end

  def new
    @course = Course.new
    @course.batches.build
  end

  def create
    @course = Course.new params[:course]
    if @course.save
      flash[:notice] = 'Created course sucessfully.'
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    if @course.update_attributes(params[:course])
      flash[:notice] = 'Updated course details successfully.'
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    if @course.batches.active.empty?
      @course.inactivate
       flash[:notice]="Course deleted successfully."
      redirect_to :action=>'manage_course'
    else
      flash[:warn_notice]="Unable to Delete. Please remove exising batches and students."
      redirect_to :action=>'manage_course'
    end
  
  end

  def show
    @batches = @course.batches
  end

  private
  def find_course
    @course = Course.find params[:id]
  end

end