class Task < ApplicationRecord
  belongs_to :robot, optional: true
  belongs_to :robot_type, optional: true

  validates :description, presence: true
  validates :eta, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
end
