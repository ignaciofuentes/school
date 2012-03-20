class CreateCualitativeGrades < ActiveRecord::Migration
  def self.up
    create_table :cualitative_grades do |t|
      t.integer :cualitative_value_id
      t.integer :student_id
      t.integer :cualitative_gradeable_id
      t.string :cualitative_gradeable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :cualitative_grades
  end
end
