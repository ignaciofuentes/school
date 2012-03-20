class CreateBatchSubjects < ActiveRecord::Migration
  def self.up
    create_table :batch_subjects do |t|
      t.integer :batch_id
      t.integer :subject_id
      t.integer :max_weekly_classes
      t.boolean :no_exams

      t.timestamps
    end
  end

  def self.down
    drop_table :batch_subjects
  end
end
