class TimetableEntriesController < ApplicationController
  
  def index
    @batch = Batch.find(params[:batch_id])
	@entries = TimetableEntry.for_batch(@batch)
	@batch_subjects = BatchSubject.includes(:subject).where(:batch_id=> @batch.id)
  end


  def create
    @batch = Batch.find(params[:batch_id])
    batch_subject = BatchSubject.find(params[:batch_subject_id])
    @subject = batch_subject.subject
    @timetable_entry = TimetableEntry.new(:class_timing_id => params[:class_timing_id], :batch_subject_id=> params[:batch_subject_id], :weekday_id =>params[:weekday_id])
    @timetable_entry.save

  end

  def update
  end
  
  def assign_employee
    @batch = Batch.find(params[:batch_id])
    @timetable_entry = TimetableEntry.find(params[:id])
    @teachers = @timetable_entry.batch_subject.subject.employees
  end
  
  def save_employee
    @batch = Batch.find(params[:batch_id])
    @timetable_entry = TimetableEntry.find(params[:id])
    if (params[:timetable_entry])
       @timetable_entry.update_attributes(params[:timetable_entry])
    end
  end

  def destroy
  batch = Batch.find(params[:batch_id])
	TimetableEntry.find(params[:id]).destroy
	flash[:notice] = 'Timetable entry was successfully destroyed'
	redirect_to batch_timetable_entries_path(batch)
  end

end