class ClassTiming < ActiveRecord::Base
  has_many :timetable_entries
  belongs_to :schedule

  validates_presence_of :name
  

  def validate
    errors.add(:end_time, "should be later than start time.") \
      if self.start_time > self.end_time \
      unless self.start_time.nil? or self.end_time.nil?
  end
end
