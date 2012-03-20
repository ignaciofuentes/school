class Student < ActiveRecord::Base
  #attr_accessible :blood_group, :birth_place, :nationality, :language, :religion, :address_line1, :address_line_2, :city, :state, :pin_code, :country_id, :phone1, :phone2, :email 
  #attr_accessor :accessible
  
  mount_uploader :image, ImageUploader


  belongs_to :country

  has_many :batches, :through=> :batch_students
  has_many :batch_students, :class_name=> "BatchStudent"

  has_many :evaluations, :through => :grades
  has_many :grades
  has_many :indicators, :through => :cualitative_grades
  has_many :cualitative_grades

  belongs_to :student_category
  belongs_to :nationality, :class_name => 'Country'
  has_one  :user , :as => :authenticatable
  has_many :relationships
  has_many   :guardians, :through => :relationships
  
  accepts_nested_attributes_for :cualitative_grades

  scope :active, :conditions => { :is_active => true }

  validates_presence_of :unique_id, :admission_date, :first_name, :batch_ids, :date_of_birth, :gender
  validates_uniqueness_of :unique_id

  
  # Methods ................................*************
  
  def batch
    batches.active.first
  end

  # StartGrade Methods ................................*************

  def grade_for_batch_subject_period(batch_subject, period)
    if batch_subject.batch.evaluation_structure.numeric?
      grade = 0
      Grade.for_student(self).for_batch_subject(batch_subject).for_period(period).each do |g|
        grade+= g.value * (g.evaluation.percentage/100)
      end
      grade.round(0)
    else
      "a"
    end 
  end

  def grade_for_batch_subject(batch_subject)
    if batch_subject.batch.evaluation_structure.numeric?
    grade = 0
    periods = batch_subject.batch.evaluation_structure.periods
    periods.each do |period|
      grade += grade_for_batch_subject_period(batch_subject, period)
    end
    (grade/periods.count).round(0)
  else
    "a"
  end
  end
  
  def failed_subjects
    0
  end

  # End Grade Methods ................................*************

  def first_and_last_name
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def gender_as_text
    return 'Male' if gender.downcase == 'm'
    return 'Female' if gender.downcase == 'f'
    nil
  end

 def email
   if user
     user.email
   else
     ""
   end
 end



end