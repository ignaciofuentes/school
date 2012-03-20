class RemoveBsFromEmployee < ActiveRecord::Migration
  def self.up
    remove_column :employees, :photo_filename
    remove_column :employees, :photo_content_type
    remove_column :employees, :photo_data
    remove_column :employees, :user_id
  end

  def self.down
    add_column :employees, :photo_filename, :string
    add_column :employees, :photo_content_type, :string
    add_column :employees, :photo_data, :binary
    add_column :employees, :user_id, :integer
  end
end
