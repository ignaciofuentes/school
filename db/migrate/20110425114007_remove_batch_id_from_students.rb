class RemoveBatchIdFromStudents < ActiveRecord::Migration
  def self.up
    remove_column :students, :batch_id
  end

  def self.down
    add_column :students, :batch_id, :integer
  end
end
