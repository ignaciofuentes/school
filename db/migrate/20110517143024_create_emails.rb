class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :subject
      t.text :content
      t.boolean :guardians
      t.boolean :students
      t.boolean :employees

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
