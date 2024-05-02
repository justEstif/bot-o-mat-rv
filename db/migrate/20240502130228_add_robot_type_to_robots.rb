class AddRobotTypeToRobots < ActiveRecord::Migration[7.1]
  def change
    add_reference :robots, :robot_type, foreign_key: true
  end
end
