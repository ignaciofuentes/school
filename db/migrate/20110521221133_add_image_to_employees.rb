class AddImageToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :image, :string
  end

  def self.down
    remove_column :employees, :image
  end
end
