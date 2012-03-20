class RemoveLanguageFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :language
  end

  def self.down
    add_column :users, :language, :string
  end
end
