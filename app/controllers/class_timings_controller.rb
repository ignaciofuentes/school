class ClassTimingsController < ApplicationController
  before_filter :login_required
  filter_access_to :all

  def index
    @schedule = Schedule.find(params[:schedule_id])
    @class_timings = @schedule.class_timings
  end

  def create
    @schedule = Schedule.find(params[:schedule_id])
    @class_timing = @schedule.class_timings.build(params[:class_timing])
    @class_timing.save
    @class_timings = @schedule.class_timings.order(:start_time)
  end

  def edit
    @class_timing = ClassTiming.find(params[:id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  def update
    @schedule = Schedule.find(params[:schedule_id])
    @class_timing = ClassTiming.find params[:id]
    @class_timing.update_attributes(params[:class_timing])
  end

  def show
    @batch = Batch.find params[:batch_id]
    @class_timings = ClassTiming.for_batch(params[:batch_id])
    respond_to do |format|
      format.js { render :action => 'show' }
    end
  end

  def destroy
    @schedule = Schedule.find(params[:schedule_id])
    @class_timing = ClassTiming.find params[:id]
    @class_timing.destroy
    redirect_to @schedule
  end

end
