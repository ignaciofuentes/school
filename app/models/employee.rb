class Employee < ActiveRecord::Base

  belongs_to  :employee_category
  has_one  :user , :as => :authenticatable
  belongs_to  :employee_position
  belongs_to  :employee_grade
  belongs_to  :employee_department
  belongs_to  :nationality, :class_name => 'Country'
  has_many    :employee_bank_details
  has_many    :employee_additional_details
  has_many  :subjects, :through=> :employee_subjects
  has_many :employee_subjects
  has_many :timetable_entries

  validates_presence_of :employee_number, :employee_category_id, :employee_position_id, :employee_department_id, :employee_grade_id, :joining_date

  validates_uniqueness_of  :employee_number

  # other methods omittted.  

  def email
    if user
      user.email
    else
      ""
    end
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

end
