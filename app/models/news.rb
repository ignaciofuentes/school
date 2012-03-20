class News < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :comments, :class_name => 'NewsComment'
  
  validates_presence_of :title, :content

  default_scope :order => 'created_at DESC'

  cattr_reader :per_page

  @@per_page = 12
  
  def self.search(search)
    
    if search
      where("title LIKE ?", "%#{search}%")
    else
      all
    end
  
  end
end