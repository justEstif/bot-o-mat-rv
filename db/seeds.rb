# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

tasks_list = [
  {
    "description": "do the dishes",
    "eta": 1000,
  },
  {
    "description": "sweep the house",
    "eta": 3000,
  },
  {
    "description": "do the laundry",
    "eta": 10000,
  },
  {
    "description": "take out the recycling",
    "eta": 4000,
  },
  {
    "description": "make a sammich",
    "eta": 7000,
  },
  {
    "description": "mow the lawn",
    "eta": 20000,
  },
  {
    "description": "rake the leaves",
    "eta": 18000,
  },
  {
    "description": "give the dog a bath",
    "eta": 14500,
  },
  {
    "description": "bake some cookies",
    "eta": 8000,
  },
  {
    "description": "wash the car",
    "eta": 20000,
  },
]

tasks_list.each do |task_info|
  Task.create!(description: task_info[:description], eta: task_info[:eta], completed: false)
end

RobotType.create!([
  { name: "Unipedal" },
  { name: "Bipedal" },
  { name: "Quadrupedal" },
  { name: "Arachnid" },
  { name: "Radial" },
  { name: "Aeronautical" },
])

puts "Seed data created successfully!"
