class AddGuardianToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :guardian, :bool
  end

  def self.down
    remove_column :users, :guardian
  end
end
