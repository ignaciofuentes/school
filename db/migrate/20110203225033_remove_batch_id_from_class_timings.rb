class RemoveBatchIdFromClassTimings < ActiveRecord::Migration
  def self.up
	add_column :class_timings, :schedule_id, :integer
	remove_column :class_timings, :batch_id
  end

  def self.down
	remove_column :class_timings, :schedule_id
	add_column :class_timings, :batch_id, :integer
  end
end
