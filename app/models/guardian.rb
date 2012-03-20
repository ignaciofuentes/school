class Guardian < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  belongs_to :country
  has_many :relationships
  has_many :students, :through => :relationships
  has_one  :user , :as => :authenticatable

  validates_presence_of :first_name


  def is_immediate_contact?
    ward.immediate_contact_id == id
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def archive_guardian(archived_student)
    guardian_attributes = self.attributes
    guardian_attributes.delete "id"
    guardian_attributes["ward_id"] = archived_student
    self.delete if ArchivedGuardian.create(guardian_attributes)
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
