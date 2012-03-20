class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.integer :evaluation_id
      t.integer :student_id
      t.decimal :value, :precision => 5, :scale=> 2

      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end
end
