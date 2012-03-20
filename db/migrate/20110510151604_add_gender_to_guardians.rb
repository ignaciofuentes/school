class AddGenderToGuardians < ActiveRecord::Migration
  def self.up
    add_column :guardians, :gender, :string
  end

  def self.down
    remove_column :guardians, :gender
  end
end
