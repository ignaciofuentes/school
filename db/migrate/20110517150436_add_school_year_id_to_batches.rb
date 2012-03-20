class AddSchoolYearIdToBatches < ActiveRecord::Migration
  def self.up
    add_column :batches, :school_year_id, :integer
  end

  def self.down
    remove_column :batches, :school_year_id
  end
end
