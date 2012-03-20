class AddUniqueIdToGuardians < ActiveRecord::Migration
  def self.up
    add_column :guardians, :unique_id, :integer
  end

  def self.down
    remove_column :guardians, :unique_id
  end
end
