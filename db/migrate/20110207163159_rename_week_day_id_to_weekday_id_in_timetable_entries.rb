class RenameWeekDayIdToWeekdayIdInTimetableEntries < ActiveRecord::Migration
  def self.up
    rename_column :timetable_entries, :week_day_id, :weekday_id
  end

  def self.down
    rename_column :timetable_entries, :weekday_id, :week_day_id
  end
end
