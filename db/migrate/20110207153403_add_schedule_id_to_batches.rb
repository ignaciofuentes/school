class AddScheduleIdToBatches < ActiveRecord::Migration
  def self.up
    add_column :batches, :schedule_id, :integer
  end

  def self.down
    remove_column :batches, :schedule_id
  end
end
