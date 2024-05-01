class CreateRobots < ActiveRecord::Migration[7.1]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :robot_type

      t.timestamps
    end
  end
end
