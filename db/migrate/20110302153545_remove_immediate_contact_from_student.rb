class RemoveImmediateContactFromStudent < ActiveRecord::Migration
  def self.up
	remove_column :students, :immediate_contact_id
  end

  def self.down
	add_column :students, :immediate_contact_id, :integer
  end
end
