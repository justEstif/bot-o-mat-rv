class AddRobotTypeToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :robot_type, foreign_key: true
  end
end
