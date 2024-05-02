class Robot < ApplicationRecord
  belongs_to :robot_type
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :robot_type, presence: true
end
