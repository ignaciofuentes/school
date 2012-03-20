class AddBatchSubjectIdToTimetableEntries < ActiveRecord::Migration
  def self.up
    add_column :timetable_entries, :batch_subject_id, :integer
    remove_column :timetable_entries, :batch_id
    remove_column :timetable_entries, :subject_id
  end

  def self.down
    remove_column :timetable_entries, :batch_subject_id
    add_column :timetable_entries, :subject_id, :integer
    add_column :timetable_entries, :batch_id, :integer
  end
end
