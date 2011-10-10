class SpentTime < ActiveRecord::Base
  attr_accessible :day, :spent_time
  
  belongs_to :task
  
  validates :task_id, :presence => true,
                      :numericality => true
  validates :day, :presence => true
  validates :spent_time, :presence => true,
                         :inclusion => { :in => 1..1440 },
                         :numericality => true
  
  default_scope :order => 'spent_times.created_at DESC'
  
  def formatted_day
    day.to_formatted_s(:long)
  end
end
