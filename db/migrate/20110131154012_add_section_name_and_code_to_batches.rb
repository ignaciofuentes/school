class AddSectionNameAndCodeToBatches < ActiveRecord::Migration
  def self.up
    add_column :batches, :section_name, :string
    add_column :batches, :code, :string
    remove_column :courses, :section_name
    remove_column :courses, :code
  end

  def self.down
    remove_column :batches, :code
    remove_column :batches, :section_name
    add_column :courses, :section_name, :string
    add_column :courses, :code, :string
  end
end
