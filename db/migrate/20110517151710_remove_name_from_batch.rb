class RemoveNameFromBatch < ActiveRecord::Migration
  def self.up
    remove_column :batches, :name
  end

  def self.down
    add_column :batches, :name, :string
  end
end
