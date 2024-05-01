class Robot < ApplicationRecord
  enum robot_type: {
    unipedal: "Unipedal",
    bipedal: "Bipedal",
    quadrupedal: "Quadrupedal",
    arachnid: "Arachnid",
    radial: "Radial",
    aeronautical: "Aeronautical",
  }

  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :robot_type, presence: true
end
