class CreateEmployeeSubjects < ActiveRecord::Migration
  def self.up
    create_table :employee_subjects do |t|
      t.integer :employee_id
      t.integer :subject_id
      t.timestamps
    end
  end

  def self.down
    drop_table :employee_subjects
  end
end
