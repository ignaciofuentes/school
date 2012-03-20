class CreateCualitativeValues < ActiveRecord::Migration
  def self.up
    create_table :cualitative_values do |t|
      t.integer :evaluation_structure_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :cualitative_values
  end
end
