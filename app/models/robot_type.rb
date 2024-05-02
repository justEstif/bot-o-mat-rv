class RobotType < ApplicationRecord
  enum name: {
    unipedal: "Unipedal",
    bipedal: "Bipedal",
    quadrupedal: "Quadrupedal",
    arachnid: "Arachnid",
    radial: "Radial",
    aeronautical: "Aeronautical",
  }
end
