class Privilege < ActiveRecord::Base
  has_many :users, :through=> :privileges_users
  has_many :privileges_users
end
