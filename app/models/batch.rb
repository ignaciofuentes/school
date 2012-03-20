class Batch < ActiveRecord::Base

  
  belongs_to :course
  has_many :students, :through=> :batches_students
  has_many :batches_students, :class_name=> "BatchStudent"
  has_many :batch_subjects
  has_many :subjects, :through=> :batch_subjects ,:conditions => { :is_deleted => false }
  has_many :evaluations, :through => :batch_subjects
  belongs_to :schedule
  belongs_to :evaluation_structure
  belongs_to :school_year
  has_many :emails, :through=> :batch_emails
  has_many :batch_emails
  has_many :timetable_entries, :through=> :batch_subjects
  
  
  def full_name
    "#{course.name} - #{name} - " + I18n.t("batches.section") + " #{section_name}" 
  end
  
  def name
    school_year.name
  end

  def self.eligible
    active + upcoming
  end
  
  def self.active
    joins(:school_year).where("school_years.status"=> SchoolYear::ACTIVE)
  end
  
  def self.upcoming
    joins(:school_year).where("school_years.status"=> SchoolYear::UPCOMING)
  end
  
  def guardians
    s = students.map {|student| student.guardians}
    s = s.flatten
    return s
  end
  
  def employees
    e = timetable_entries.map {|t| t.employee}
    e = e.flatten.compact
    return e 
  end
  
end
