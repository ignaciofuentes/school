class Relationship < ActiveRecord::Base
	belongs_to :student
	belongs_to :guardian
	belongs_to :relationship_type
	
	  accepts_nested_attributes_for :guardian
	  
	  def self.for_student(student)
	   where(:student_id => student.id).first
	  end
end
