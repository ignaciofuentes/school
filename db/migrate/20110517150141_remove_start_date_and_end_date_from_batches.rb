class RemoveStartDateAndEndDateFromBatches < ActiveRecord::Migration
  def self.up
    remove_column :batches, :start_date
    remove_column :batches, :end_date
  end

  def self.down
    add_column :batches, :start_date, :date
    add_column :batches, :end_date, :date
  end
end
