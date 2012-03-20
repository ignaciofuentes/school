class Schedule < ActiveRecord::Base

validates_presence_of :name
has_many :class_timings
has_many :batches

end
