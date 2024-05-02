class RobotType < ApplicationRecord
  has_many :robots
  has_many :tasks

  def can_perform_task?(task)
    tasks.exists?(id: task.id)
  end

  enum name: {
    unipedal: "Unipedal",
    bipedal: "Bipedal",
    quadrupedal: "Quadrupedal",
    arachnid: "Arachnid",
    radial: "Radial",
    aeronautical: "Aeronautical",
  }
end
