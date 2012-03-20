class PrivilegesUser < ActiveRecord::Base
  attr_accessible :privilege_id
  
  belongs_to :user
  belongs_to :privilege

end