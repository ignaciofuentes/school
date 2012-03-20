class AddImageToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :image, :string
  end

  def self.down
    remove_column :students, :image
  end
end
