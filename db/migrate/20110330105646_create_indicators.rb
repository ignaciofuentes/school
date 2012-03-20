class CreateIndicators < ActiveRecord::Migration
  def self.up
    create_table :indicators do |t|
      t.text :description
      t.integer :competence_id

      t.timestamps
    end
  end

  def self.down
    drop_table :indicators
  end
end
