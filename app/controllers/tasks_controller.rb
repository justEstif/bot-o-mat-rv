class TasksController < ApplicationController
  def index
    @tasks = Task.where(completed: false)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully deleted."
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
      if @robot.can_perform_task?(task)
        eta_ms = task.eta || 0
        # sleep(eta_ms/1000)
        sleep(eta_ms / 100000) # NOTE: using 100000 for quicker responses
        flash[:notice] = "Working on task " + task.description
        task.update(completed: true)
      end
    end

    flash[:notice] = "Tasks completed successfully"
    redirect_to @robot
  end

  def task_params
    params.require(:task).permit(:description, :eta, :robot_type_id, :robot_id)
  end
end
