class Subject < ActiveRecord::Base
  
  has_many :batch_subjects
  belongs_to :course
  has_many :batches, :through=>:batch_subjects

  has_many :employees, :through => :employee_subjects
  has_many :employee_subjects

  validates_presence_of :name, :code

  scope :for_batch, lambda { |b| { :conditions => { :batch_id => b.to_i, :is_deleted => false } } }

  def inactivate
    update_attribute(:is_deleted, true)
  end

  def full_name
    name + " ("+ course.name+ ")"
  end

end
