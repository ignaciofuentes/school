class BatchEmail < ActiveRecord::Base
  
  belongs_to :batch
  belongs_to :email
  
end
