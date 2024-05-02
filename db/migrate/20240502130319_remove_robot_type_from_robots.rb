class RemoveRobotTypeFromRobots < ActiveRecord::Migration[7.1]
  def change
    remove_column :robots, :robot_type, :string
  end
end
