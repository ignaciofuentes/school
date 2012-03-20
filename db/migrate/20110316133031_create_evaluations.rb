class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.string :name
      t.text :description
      t.integer :batch_subject_id
      t.integer :period_id

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluations
  end
end
