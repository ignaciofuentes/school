class BatchStudentsController < ApplicationController
  
  def index
      @student=Student.find(params[:student_id])
  end
  
  def new
    @student=Student.find(params[:student_id])
    @courses = Course.all
    @batch_student = @student.batch_students.build
  end
  
  def create
    @student=Student.find(params[:student_id])
    @batch_student = BatchStudent.new(:batch_id => params[:batch_id], :student_id =>params[:student_id])
      if @batch_student.save
        flash[:notice] = 'Created Batch_Student sucessfully.'
        redirect_to student_batch_students_path(@student)
      else
        render 'new'
      end
  end
  
  def destroy
    @student=Student.find(params[:student_id])
    @batch_student = @student.batch_students.find(params[:id])
    
  end
  
end