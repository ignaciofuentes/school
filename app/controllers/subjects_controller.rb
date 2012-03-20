class SubjectsController < ApplicationController

  def index
    @course = Course.find(params[:course_id])
    @subjects = @course.active_subjects
  end

  def new
    @course = Course.find(params[:course_id])
    respond_to do |format|
      format.js { render :action => 'new' }
    end
  end

  def create
    @course = Course.find(params[:course_id])
    @subject = @course.subjects.build(params[:subject])
    @subject.save
  end

  def edit
    @course = Course.find(params[:course_id])
    @subject = Subject.find params[:id]
  end

  def update
    @course = Course.find(params[:course_id])
    @subject = Subject.find params[:id]
    @subject.update_attributes(params[:subject])
  end

  def destroy
    @course = Course.find(params[:course_id])
    @subject = Subject.find params[:id]
   @subject_exams= Exam.find_by_subject_id(@subject.id)
   if @subject_exams.nil?
    @subject.inactivate
   else
    @error_text = "Cannot delete subjects"
    end
	respond_to do |format|
      format.html { redirect_to course_subjects_path(@course) }
    end
  end

  def show
    if params[:course_id] == ''
      @subjects = []
    else
      @course = Course.find params[:course_id]
      @subjects = @course.normal_batch_subject
      @elective_groups = ElectiveGroup.find_all_by_batch_id(params[:course_id])
    end
    respond_to do |format|
      format.js { render :action => 'show' }
    end
  end
  
  def assign_previous_batch_subject
     @course = Course.find params[:course_id]
     
     @previous_subject = Subject.find(params[:id])
     
     sub_exists = Subject.where(:course_id =>@course.id, :name=>@previous_subject.name, :is_deleted=>false).exists?
   
     @subject_new = Subject.new(:name=>@previous_subject.name,:code=>@previous_subject.code,:course_id=>@course.id,:no_exams=>@previous_subject.no_exams,
       :max_weekly_classes=>@previous_subject.max_weekly_classes,:elective_group_id=>@previous_subject.elective_group_id,:is_deleted=>false)
     if !sub_exists 
       @test = "entro" 
         @subject_new.save     
     end
   end
  

end