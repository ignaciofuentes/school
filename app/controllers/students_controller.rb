class StudentsController < ApplicationController

  filter_resource_access

  def index
    @search = Student.search(params[:search])
    @students = @search.all 
  end

  def new
    @student = Student.new
  end

  def create 
    @student = Student.new params[:student]
    if @student.save
      flash[:notice] = 'Created student sucessfully.'
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    if @student.update_attributes(params[:student])
      flash[:notice] = 'Updated student details successfully.'
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    student = Student.find(params[:id])
    user = User.destroy_all(:username => student.unique_id) unless user.nil?
    Student.destroy(params[:id])
    flash[:notice] = "All records have been deleted for student with admission no. #{student.unique_id}."
    redirect_to :controller => 'users', :action => 'dashboard'
  end

  def edit
    @student= Student.find(params[:id])
  end

  def show
    @current_user = current_user
    @student=Student.find(params[:id])
    @additional_fields = StudentAdditionalField.all(:conditions=>"status = true")
  end

  def final_grades
    @student=Student.find(params[:id])
    @batch = @student.batches.find(params[:batch_id])
    @periods = @batch.evaluation_structure.periods
    @batch_subjects = @batch.batch_subjects
  end

  def assign_cualitative_grades
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @student = @batch_subject.batch.students.find(params[:id])
    @periods = @batch_subject.batch.evaluation_structure.periods
    competences = @batch_subject.competences.order(:period_id)
    competences.each do |c|
      cualitative_grade = @student.cualitative_grades.for_cualitative_gradeable(c)
      if !cualitative_grade.exists?  
        cualitative_grade = @student.cualitative_grades.build(:cualitative_gradeable_id=> c.id, :cualitative_gradeable_type=>c.class.to_s)       
      end  
      c.indicators.each do |i|
        cualitative_grade = @student.cualitative_grades.for_cualitative_gradeable(i)
        if !cualitative_grade.exists?  
          @student.cualitative_grades.build(:cualitative_gradeable_id=> i.id, :cualitative_gradeable_type=>i.class.to_s)       
        end 
      end
    end
  end

  def save_cualitative_grades
    @student = Student.find(params[:id])
    @student.update_attributes(params[:student])
    redirect_to @student
  end
  
  def academic_status
    @student = Student.find(params[:id])
    if(params[:batch_id])
      @batch=@student.batches.find(params[:batch_id])
    else
      @batch=@student.batch
    end
    @start_date = Time.now - 2.weeks
    @end_date = Time.now + 3.weeks
    if params[:start_date] && params[:end_date]
      @start_date = params[:start_date].to_date
      @end_date = params[:end_date].to_date
    end
    @evaluations = @batch.evaluations.where(:date => (@start_date)..(@end_date)).order(:date)
  end
  
  def schedule
    @student = Student.find(params[:id])
    @batch = @student.batch
    @entries = TimetableEntry.for_batch(@batch)
  	@batch_subjects = BatchSubject.includes(:subject).where(:batch_id=> @batch.id)
  end

  #################NOT WORKINNNG!
  def image
    @student = Student.find_by_unique_id(params[:id])
    send_data(@student.photo_data,
    :type => @student.photo_content_type,
    :filename => @student.photo_filename,
    :disposition => 'inline')
  end


  def email
    sender = current_user.email
    if request.post?
      recipient_list = []
      case params['email']['recipients']
      when 'Student'
        recipient_list << @student.email
      when 'Guardian'
        recipient_list << @student.immediate_contact.email unless @student.immediate_contact.nil?
      when 'Student & guardian'
        recipient_list << @student.email
        recipient_list << @student.immediate_contact.email unless @student.immediate_contact.nil?
      end
      recipients = recipient_list.join(', ')
      SchoolMailer.send_email(sender,recipients, params['email']['subject'], params['email']['message']).deliver
      flash[:notice] = "Mail sent to #{recipients}"
      redirect_to :controller => 'student', :action => 'profile', :id => @student.id
    end
  end








  private
  def find_student
    @student = Student.find(params[:id])
  end
end
