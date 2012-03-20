class AddPeriodIdToCompetence < ActiveRecord::Migration
  def self.up
    add_column :competences, :period_id, :integer
  end

  def self.down
    remove_column :competences, :period_id
  end
end
