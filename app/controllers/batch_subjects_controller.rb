class BatchSubjectsController < ApplicationController
  
  before_filter :new_batch_subject, :only => :index
  filter_access_to :all, :attribute_check => true
  
  def index
    @batch = Batch.find(params[:batch_id])
    @course = @batch.course
    @batch_subjects= @batch.batch_subjects
  end
  
  def show
    @batch = Batch.find(params[:batch_id])
    @course = @batch.course
    @batch_subject = @batch.batch_subjects.find(params[:id])
  end
  
  protected
  
  def new_batch_subject
     @batch = Batch.find(params[:batch_id])
     @batch_subject= @batch.batch_subjects.new
  end
  
end