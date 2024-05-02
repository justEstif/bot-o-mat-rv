class RobotsController < ApplicationController
  def index
    @robots = Robot.all
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new(robot_params)
    if @robot.save
      redirect_to robots_path
    else
      render "new"
    end
  end

  def show
    @robot = Robot.find(params[:id])
    @tasks = @robot.tasks
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :robot_type_id)
  end
end
