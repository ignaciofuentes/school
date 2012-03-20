class RemoveBatchIdAndNoExamsAndMaxWeeklyClassesFromSubjects < ActiveRecord::Migration
  def self.up
     remove_column :subjects, :batch_id
     remove_column :subjects, :max_weekly_classes
     remove_column :subjects, :no_exams
   end

   def self.down
     add_column :subjects, :batch_id, :integer
     add_column :subjects, :max_weekly_classes, :integer
     add_column :subjects, :no_exams, :boolean
   end
end
