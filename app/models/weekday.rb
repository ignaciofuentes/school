class Weekday < ActiveRecord::Base
  has_many :timetable_entries
  
end
