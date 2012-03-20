class RenameColumnCourseNameToNameInCourses < ActiveRecord::Migration
  def self.up
    rename_column :courses, :course_name, :name
  end

  def self.down
    rename_column :courses, :name, :course_name
  end
end
