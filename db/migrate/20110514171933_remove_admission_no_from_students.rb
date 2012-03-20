class RemoveAdmissionNoFromStudents < ActiveRecord::Migration
  def self.up
    remove_column :students, :admission_no
  end

  def self.down
    add_column :students, :admission_no, :integer
  end
end
