class AddStatusToBatches < ActiveRecord::Migration
  def self.up
    add_column :batches, :status, :integer
  end

  def self.down
    remove_column :batches, :status
  end
end
