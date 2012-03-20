class DropPrivilegesUsersTable < ActiveRecord::Migration
  def self.up
    drop_table :privileges_users
  end

  def self.down
     create_table :privileges_users, :id => false do |t|
        t.integer   :user_id
        t.integer   :privilege_id
        t.integer   :id  
      end
  end
end
