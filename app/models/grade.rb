class Grade < ActiveRecord::Base

belongs_to :student
belongs_to :evaluation

scope :for_student, lambda{|student|  where("student_id"=>student.id)}
scope :for_evaluation, lambda{|evaluation|  where("evaluation_id"=>evaluation.id)}
scope :for_period, lambda{|period| joins(:evaluation).where("evaluations.period_id"=>period.id)}
scope :for_batch_subject, lambda{|batch_subject| joins(:evaluation).where("evaluations.batch_subject_id"=>batch_subject.id)}


end