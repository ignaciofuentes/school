class Course < ActiveRecord::Base
  

  has_many :subjects
  has_many :batches
  accepts_nested_attributes_for :batches
  
  
  validates_presence_of :name
  validate :presence_of_initial_batch, :on => :create

  scope :active, :conditions => { :is_deleted => false }, :order => 'name asc'
  scope :deleted, :conditions => { :is_deleted => true }, :order => 'name asc'


  def presence_of_initial_batch
    errors.add_to_base "Should have an initial batch" if batches.length == 0
  end

  def inactivate
    update_attribute(:is_deleted, true)
  end
  
  def full_name
    "#{name}"
  end
  
  def active_subjects
    subjects.where(:is_deleted => false)
  end

#  def guardian_email_list
#    email_addresses = []
#    students = self.students
#    students.each do |s|
#      email_addresses << s.immediate_contact.email unless s.immediate_contact.nil?
#    end
#    email_addresses
#  end
#
#  def student_email_list
#    email_addresses = []
#    students = self.students
#    students.each do |s|
#      email_addresses << s.email unless s.email.nil?
#    end
#    email_addresses
#  end

end