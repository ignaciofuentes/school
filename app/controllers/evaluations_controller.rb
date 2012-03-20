class EvaluationsController < ApplicationController

  filter_access_to :all, :attribute_check=> true, :load_method => :find_batch

  def index
    @evaluations = Evaluation.for_batch(@batch) 
  end

  def show
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @evaluation = @batch_subject.evaluations.find(params[:id])
  end

  def new
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @evaluation = @batch_subject.evaluations.build
    @periods = @batch_subject.batch.evaluation_structure.periods
  end

  def edit
    @evaluation = Evaluation.find(params[:id])	
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @periods = @batch_subject.batch.evaluation_structure.periods
  end

  def create
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @evaluation = @batch_subject.evaluations.build(params[:evaluation])
    @batch = @batch_subject.batch
    if @evaluation.save
      redirect_to([@batch_subject.batch, @batch_subject], :notice => 'Evaluation was successfully created.') 
    else
      render :action => "new"
    end
  end

  def update
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.update_attributes(params[:evaluation])
      redirect_to([@batch_subject, @evaluation], :notice => 'Evaluation was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy
    redirect_to(evaluations_url)
  end

  def assign_grades
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @evaluation = Evaluation.find(params[:id])
    @batch = @batch_subject.batch
    @students = @batch.students  
    @students.each do |s|
      grade = Grade.for_student(s).for_evaluation(@evaluation)
      if !grade.exists?  
        @evaluation.grades.build(:value=> 0,:student_id=>s.id)       
      end	
    end
  end

  def save_grades
    @evaluation = Evaluation.find(params[:id])
    @evaluation.update_attributes(params[:evaluation])
    redirect_to [@evaluation.batch_subject, @evaluation]
  end
  
  def grades
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @evaluations = @batch_subject.evaluations
    @students = @batch_subject.batch.students
  end

  protected
  def find_batch
    if params[:batch_id]
      @batch = Batch.find(params[:batch_id]) 
    else
      @batch_subject = BatchSubject.find(params[:batch_subject_id])
      @batch = @batch_subject.batch 
    end
    @batch
  end
  
end
