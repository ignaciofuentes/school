class RemoveIsDeletedFromBatch < ActiveRecord::Migration
  def self.up
    remove_column :batches, :is_deleted
    remove_column :batches, :is_active
  end

  def self.down
    add_column :batches, :is_deleted, :bool
    add_column :batches, :is_active, :bool
  end
end
