class SchoolYear < ActiveRecord::Base
  ACTIVE = 1
  INACTIVE = 2
  UPCOMING = 3
  
  has_many :batches
  
  validates_presence_of :name, :start_date, :end_date
  validates_inclusion_of :status, :in => [ACTIVE, INACTIVE, UPCOMING]
  
end
