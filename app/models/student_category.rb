class StudentCategory < ActiveRecord::Base

  has_many :students

  validates_presence_of :name
  validates_uniqueness_of :name,:case_sensitive => false

  before_destroy :find_all_students
    
    def find_all_students
    students = Student.find_all_by_student_category_id self
    students.each { |s| s.student_category_id = nil }
    end
end
