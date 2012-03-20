class BatchesController < ApplicationController


  
  def index
    @course = Course.find params[:course_id]
    @batches = @course.batches
  end

  def new
    @course = Course.find params[:course_id]
    @batch = @course.batches.build
  end

  def create
    @course = Course.find params[:course_id]
    @batch = @course.batches.build(params[:batch])
    if @batch.save
      flash[:notice] = 'Batch created successfully.'
      redirect_to [@course, @batch]
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find params[:course_id]
    @batch = Batch.find params[:id]
  end

  def update
    @course = Course.find params[:course_id]
    @batch = Batch.find params[:id]
    if @batch.update_attributes(params[:batch])
      flash[:notice] = 'Updated batch details successfully.'
      redirect_to [@course, @batch]
    else
      flash[:notice] = "Please fill all feilds"
       redirect_to  edit_course_batch_path(@course, @batch)
    end
  end

  def show    
    @batch = Batch.find params[:id]
	  @course= @batch.course
    @students = @batch.students
  end

  def destroy
    @course = Course.find params[:course_id]
    @batch = Batch.find params[:id]
    if @batch.students.empty? and @batch.subjects.empty?
    @batch.inactivate
    flash[:notice] = 'Batch deleted successfully.'
     redirect_to @course
    else
     flash[:warn_notice] = '<p>Unable to delete Batch.Please delete all Students first.</p>' if @batch.students.empty?
     flash[:warn_notice] = '<p>Unable to delete Batch.Please delete all Subjects first.</p>' if @batch.subjects.empty?
   redirect_to [@course, @batch]
    end
  end
  
  def batch_transfer
    @batch = Batch.find params[:id]
  end
  
  def assign_batch_transfer
    
    batch = Batch.find params[:id]
    upcoming_batch = Batch.find(params[:Batch][:id])
    students = batch.students.find(params[:Student_ids])
    upcoming_batch.students << students
    redirect_to [upcoming_batch.course, upcoming_batch]

  end

end