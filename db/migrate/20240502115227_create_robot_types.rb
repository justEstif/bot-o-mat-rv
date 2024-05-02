class CreateRobotTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :robot_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
