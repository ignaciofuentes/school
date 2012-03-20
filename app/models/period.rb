class Period < ActiveRecord::Base

  belongs_to :evaluation_structure
  has_many :evaluations, :dependent => :destroy
  has_many :competences, :dependent => :destroy
  
end
