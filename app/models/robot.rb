class Robot < ApplicationRecord
  belongs_to :robot_type
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :robot_type_id, presence: true

  def can_perform_task?(task)
    if task.robot_type_id.nil?
      true
    else
      robot_type.can_perform_task?(task)
    end
  end

  def completed_tasks_count
    tasks.where(completed: true).count
  end

  def self.leaderboard
    all.sort_by { |robot| -robot.completed_tasks_count }
  end
end
