class ChangeRobotIdToNullableInTasks < ActiveRecord::Migration[7.1]
  def up
    change_column :tasks, :robot_id, :integer, null: true
  end

  def down
    change_column :tasks, :robot_id, :integer, null: false
  end
end
