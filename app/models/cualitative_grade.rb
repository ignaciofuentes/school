class CualitativeGrade < ActiveRecord::Base
  
  belongs_to :cualitative_gradeable, :polymorphic => true
  belongs_to :student
  
  scope :for_cualitative_gradeable, lambda{|cualitative_gradeable|  where("cualitative_gradeable_type"=>cualitative_gradeable.class.name).where("cualitative_gradeable_id"=>cualitative_gradeable.id)}
  scope :for_student, lambda{|student|  where("student_id"=>student.id)}
  def period
    cualitative_gradeable.period
  end
  
end
