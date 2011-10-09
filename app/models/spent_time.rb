class SpentTime < ActiveRecord::Base
  attr_accessible :day, :spent_time
  
  belongs_to :task
  
  validates :task_id, :presence => true
  validates :day, :presence => true
  validates :spent_time, :presence => true, :length => { :maximum => 1440 }
  
  default_scope :order => 'spent_times.created_at DESC'
end
