Factory.define :spent_time do |spent_time|
  spent_time.spent_time 10
  spent_time.day        Date.today
  spent_time.task_id    :task
end