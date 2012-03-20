class Evaluation < ActiveRecord::Base
  belongs_to :batch_subject
  belongs_to :period
  has_many :students, :through => :grades
  has_many :grades
  
  scope :for_batch,lambda{|batch| joins(:batch_subject).where('batch_subjects.batch_id' =>batch.id)}
  scope :for_period,lambda{|period| where('period_id' =>period.id)}
  
  accepts_nested_attributes_for :grades
  
end
