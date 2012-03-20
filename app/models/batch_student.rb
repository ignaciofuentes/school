class BatchStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :batch
  
  set_table_name "batches_students"
end
