class RemoveBSfromStudent < ActiveRecord::Migration
  def self.up
    remove_column :students, :class_roll_no
    remove_column :students, :is_sms_enabled
    remove_column :students, :photo_filename
    remove_column :students, :photo_content_type
    remove_column :students, :photo_data
    remove_column :students, :status_description
    remove_column :students, :user_id
    
  end

  def self.down
    add_column :students, :class_roll_no, :string
    add_column :students, :is_sms_enabled, :boolean
    add_column :students, :photo_filename, :string
    add_column :students, :photo_content_type, :string
    add_column :students, :photo_data, :binary
    add_column :students, :status_description, :string
    add_column :students, :user_id, :integer
  end
end
  
