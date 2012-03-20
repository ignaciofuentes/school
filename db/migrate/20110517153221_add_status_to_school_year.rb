class AddStatusToSchoolYear < ActiveRecord::Migration
  def self.up
    add_column :school_years, :status, :integer
  end

  def self.down
    remove_column :school_years, :status
  end
end
