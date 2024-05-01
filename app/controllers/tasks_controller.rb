class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def assign_tasks
    @robot = Robot.find(params[:id])
    unassigned_tasks = Task.where(robot_id: nil).limit(5)
    if unassigned_tasks.empty?
      flash[:notice] = "No unassigned tasks available"
    else
      unassigned_tasks.each do |task|
        task.update(robot: @robot)  # Assign task to the robot
      end
      flash[:notice] = "Tasks assigned successfully"
    end
    redirect_to @robot
  end

  def complete_tasks
    @robot = Robot.find(params[:id])
    tasks_to_complete = @robot.tasks.where(completed: false)

    tasks_to_complete.each do |task|
      eta_ms = task.eta || 0
      sleep(eta_ms/10000) # NOTE: using 10000 for quicker responses
      flash[:notice] = "Working on task " + task.description
      task.update(completed: true)
    end

    flash[:notice] = "Tasks completed successfully"
    redirect_to @robot
  end
end
