class AddNumericMaxMinToEvaluationStructure < ActiveRecord::Migration
  def self.up
    add_column :evaluation_structures, :numeric, :bool
    add_column :evaluation_structures, :max, :integer
    add_column :evaluation_structures, :min, :integer
  end

  def self.down
    remove_column :evaluation_structures, :min
    remove_column :evaluation_structures, :max
    remove_column :evaluation_structures, :numeric
  end
end
