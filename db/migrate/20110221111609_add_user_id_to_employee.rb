class AddUserIdToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :user_id, :integer
  end

  def self.down
    remove_column :employees, :user_id
  end
end
