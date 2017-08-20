class Agency < ActiveRecord::Base

  has_many :programs, :dependent => :destroy
  
  validates_presence_of :name
  validates_presence_of :purpose
  validates_length_of :phonenum, :is => 10  
  
  
  scope :sorted, lambda { order("agencies.name ASC") }
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }

end
