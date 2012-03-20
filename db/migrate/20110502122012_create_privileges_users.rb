class CreatePrivilegesUsers < ActiveRecord::Migration
  def self.up
     create_table :privileges_users do |t|
        t.integer   :user_id
        t.integer   :privilege_id
        t.timestamps
      end
  end

  def self.down
     drop_table :privileges_users
  end
end
