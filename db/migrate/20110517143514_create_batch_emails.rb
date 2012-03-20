class CreateBatchEmails < ActiveRecord::Migration
  def self.up
    create_table :batch_emails do |t|
      t.integer :batch_id
      t.integer :email_id

      t.timestamps
    end
  end

  def self.down
    drop_table :batch_emails
  end
end
