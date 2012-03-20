class EvaluationStructure < ActiveRecord::Base
  
  has_many :periods
  has_many :batches
  has_many :cualitative_values
  
  accepts_nested_attributes_for :cualitative_values, :allow_destroy=> true, :reject_if => lambda {|a| a[:name].blank?}
  
end
