class RemoveBatchIdFromWeekday < ActiveRecord::Migration
  def self.up
    remove_column :weekdays, :batch_id
  end

  def self.down
    add_column :weekdays, :batch_id, :integer
  end
end
