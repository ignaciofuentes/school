class CreateBatchStudents < ActiveRecord::Migration
  def self.up
    create_table :batches_students do |t|
      t.integer :batch_id
      t.integer :student_id

      t.timestamps
    end
  end

  def self.down
    drop_table :batches_students
  end
end
