class TimetableEntry < ActiveRecord::Base
  #attr_accessible :class_timing_id, :batch_subject_id, :weekday_id
  belongs_to :class_timing
  belongs_to :batch_subject
  belongs_to :weekday
  belongs_to :employee
  
  scope :for_batch,lambda{|batch| joins(:batch_subject).where('batch_subjects.batch_id' =>batch.id)}
  
  validate :class_timing_is_not_break
  validate :class_timing_and_weekday_and_batch_dont_repeat, :on=> :create
  
  
  def class_timing_is_not_break
    @errors.add(:base, "Can't assign a subject to a break period") if class_timing.is_break
  end
  
  def class_timing_and_weekday_and_batch_dont_repeat
    if TimetableEntry.for_batch(batch_subject.batch).where(:weekday_id => weekday_id).where(:class_timing_id => class_timing_id).exists?
      @errors.add(:base, "Can't assign a subject to a period with another subject")
    end
  end
  
end