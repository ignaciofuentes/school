class RemoveAdminGuardianStudentEmployeeFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :admin
    remove_column :users, :student
    remove_column :users, :employee
    remove_column :users, :guardian
  end

  def self.down
    add_column :users, :admin, :string
    add_column :users, :student, :string
    add_column :users, :employee, :string
    add_column :users, :guardian, :string
  end
end
