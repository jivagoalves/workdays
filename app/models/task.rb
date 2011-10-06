class Task < ActiveRecord::Base
  attr_accessible :description, :completed
  
  belongs_to :user

  validates :description, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope :order => 'tasks.created_at DESC'
end
