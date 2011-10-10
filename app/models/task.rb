class Task < ActiveRecord::Base
  attr_accessible :description, :completed
  
  belongs_to :user
  has_many :spent_times, :dependent => :destroy

  validates :description, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope :order => 'tasks.created_at DESC'
  
  def time_spent_with_me
    total_spent_time = 0
    spent_times.each do |s|
      total_spent_time += s.spent_time unless s.spent_time.blank?
    end
    total_spent_time
  end
  
  def time_spent_with_me?
    time_spent_with_me != 0
  end
end
