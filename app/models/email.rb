class Email < ActiveRecord::Base
  
  has_many :batches, :through=> :batch_emails
  has_many :batch_emails
  
end
