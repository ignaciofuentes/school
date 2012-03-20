class CreateEvaluationStructures < ActiveRecord::Migration
  def self.up
    create_table :evaluation_structures do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluation_structures
  end
end
