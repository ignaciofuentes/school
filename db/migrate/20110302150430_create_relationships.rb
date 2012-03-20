class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :relationship_type_id
      t.integer :student_id
      t.integer :guardian_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
