class RemoveWardIdFromGuardian < ActiveRecord::Migration
  def self.up
  remove_column :guardians, :ward_id
  remove_column :guardians, :relation
  end

  def self.down
	add_column :guardians, :ward_id, :integer
	add_column :guardians, :relation, :string
	
  end
end
