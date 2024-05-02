class Robot < ApplicationRecord
  belongs_to :robot_type, optional: true
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  def can_perform_task?(task)
    if robot_type.present?
      robot_type.can_perform_task?(task)
    else
      true
    end
  end

  def completed_tasks_count
    tasks.where(completed: true).count
  end

  def self.leaderboard
    all.sort_by { |robot| -robot.completed_tasks_count }
  end
end
