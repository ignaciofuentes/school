class AddAuthenticatableTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :authenticatable_type, :string
	add_column :users, :authenticatable_id, :integer
	
  end

  def self.down
    remove_column :users, :authenticatable_type
	remove_column :users, :authenticatable_id
  end
end
