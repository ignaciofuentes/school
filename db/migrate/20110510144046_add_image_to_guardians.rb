class AddImageToGuardians < ActiveRecord::Migration
  def self.up
    add_column :guardians, :image, :string
  end

  def self.down
    remove_column :guardians, :image
  end
end
