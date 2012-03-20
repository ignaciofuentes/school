class AddPercentageToEvaluations < ActiveRecord::Migration
  def self.up
	add_column :evaluations, :percentage, :decimal, :precision => 5, :scale=> 2
	add_column :evaluations, :date, :date
  end

  def self.down
  
	remove_column :evaluations, :percentage
	remove_column :evaluations, :date
  end
end
