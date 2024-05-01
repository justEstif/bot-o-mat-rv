class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :eta
      t.boolean :completed
      t.references :robot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
