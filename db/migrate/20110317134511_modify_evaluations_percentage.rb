class ModifyEvaluationsPercentage < ActiveRecord::Migration
  def self.up
    change_column :evaluations, :percentage, :decimal, :precision => 5, :scale=> 2
  end

  def self.down
    change_column :evaluations, :percentage, :decimal
  end
end
