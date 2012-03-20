class AddBatchSubjectIdToCompetence < ActiveRecord::Migration
  def self.up
    add_column :competences, :batch_subject_id, :integer
  end

  def self.down
    remove_column :competences, :batch_subject_id
  end
end
