class AddCourseIdToSubject < ActiveRecord::Migration
  def self.up
     add_column :subjects, :course_id, :integer
  end

  def self.down
    remove_column :subjects, :course_id
  end
end
