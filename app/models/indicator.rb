class Indicator < ActiveRecord::Base
  
  belongs_to :competence
  has_many :cualitative_grades, :as=> :cualitative_gradeable
  has_many :students, :through=> :cualitative_grades
  
  def period
    competence.period
  end
  
end
