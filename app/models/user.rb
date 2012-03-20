class User < ActiveRecord::Base
  #attr_accessible :email, :language_id, :password
  attr_accessor :password, :old_password, :new_password, :confirm_password, :accessible

  has_many :privileges, :through=> :privileges_users
  has_many :privileges_users
  belongs_to :authenticatable, :polymorphic => true
  belongs_to :language
  before_save :create_salt_password
  

  validates_uniqueness_of  :email
   validates_length_of     :password, :within => 4..40, :allow_nil => true
   validates_format_of     :email, :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
   :message => "must be a valid email address"
   validates_presence_of   :email
   validates_presence_of   :password, :on => :create
  
  
  def username
    email
  end
  
  def admin?
    p = Privilege.find_by_name("Admin")
    privileges.include?(p)
  end
  
  def student?
    p = Privilege.find_by_name("Student")
    privileges.include?(p)
  end

  def create_salt_password
    self.salt = random_string(8) if self.salt == nil
    self.hashed_password = Digest::SHA1.hexdigest(self.salt + self.password) unless self.password.nil?
  end


  def full_name
    "#{authenticatable.first_name} #{authenticatable.last_name}"
  end

  def check_reminders
    reminders =[]
    reminders = Reminder.find(:all , :conditions => ["recipient = '#{self.id}'"])
    count = 0
    reminders.each do |r|
      unless r.is_read
        count += 1
      end
    end
    return count
  end

  def self.authenticate?(email, password)
    u = User.find_by_email email
    u.hashed_password == Digest::SHA1.hexdigest(u.salt + password)
  end

  def random_string(len)
    randstr = ""
    chars = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    len.times { randstr << chars[rand(chars.size - 1)] }
    randstr
  end

  def role_name
   
    return nil
  end

  def role_symbols
    prv = []
    privileges.map { |privilege| prv << privilege.name.underscore.to_sym }
    prv
  end

  def student_record
    Student.find_by_user_id(self.id)
  end

  def employee_record
    Employee.find_by_employee_number(self.username)
  end

end
