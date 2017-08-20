class Program < ActiveRecord::Base

  belongs_to :agency
  has_and_belongs_to_many :categories, :dependent => :destroy
  
  validates_presence_of :name
  validates_presence_of :shortdesc
  validates_length_of :phonenum, :is => 10
  
  
  
  scope :sorted, lambda { order("programs.name ASC") }  
  
  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end


  
  
end
