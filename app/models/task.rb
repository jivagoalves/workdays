class Task < ActiveRecord::Base
  attr_accessible :description, :completed
  
  belongs_to :user
  has_many :spent_times, :dependent => :destroy

  validates :description, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope :order => 'tasks.created_at DESC'
end
