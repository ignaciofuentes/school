class AddEvaluationStructureIdToBatches < ActiveRecord::Migration
  def self.up
    add_column :batches, :evaluation_structure_id, :integer
  end

  def self.down
    remove_column :batches, :evaluation_structure_id
  end
end
