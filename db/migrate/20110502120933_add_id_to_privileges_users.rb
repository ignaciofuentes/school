class AddIdToPrivilegesUsers < ActiveRecord::Migration
  def self.up
    add_column :privileges_users, :id, :integer
  end

  def self.down
    remove_column :privileges_users, :id
  end
end
