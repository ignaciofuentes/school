class RemoveEmployeesSubjects < ActiveRecord::Migration
  def self.up
    drop_table :employees_subjects
  end

  def self.down
    create_table :employees_subjects do |t|
      t.references :employee
      t.references :subject
    end
  end
end
