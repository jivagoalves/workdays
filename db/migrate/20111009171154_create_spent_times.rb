class CreateSpentTimes < ActiveRecord::Migration
  def change
    create_table :spent_times do |t|
      t.integer :task_id
      t.date :day
      t.integer :spent_time

      t.timestamps
    end
  end
end
