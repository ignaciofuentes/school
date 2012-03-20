class BatchSubject < ActiveRecord::Base
belongs_to :batch
belongs_to :subject
has_many :timetable_entries, :dependent => :destroy
has_many :evaluations, :dependent => :destroy
has_many :competences, :dependent => :destroy


end
