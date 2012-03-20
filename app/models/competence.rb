class Competence < ActiveRecord::Base
  
  belongs_to :batch_subject
  belongs_to :period
  has_many :cualitative_grades, :as => :cualitative_gradeable
  has_many :indicators, :dependent => :destroy
  
  accepts_nested_attributes_for :indicators, :allow_destroy=> true, :reject_if => lambda {|a| a[:description].blank?}
  
  scope :for_period, lambda{|period|  where("period_id"=>period.id)}
  
end
