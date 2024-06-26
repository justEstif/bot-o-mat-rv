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
      redirect_to robots_path, notice: "Robot was successfully created."
    else
      render :new
    end
  end

  def show
    @robot = Robot.find(params[:id])
    @tasks = @robot.tasks
  end

  def edit
    @robot = Robot.find(params[:id])
  end

  def update
    @robot = Robot.find(params[:id])
    if @robot.update(robot_params)
      redirect_to robot_path(@robot), notice: "Robot updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @robot = Robot.find(params[:id])
    @robot.destroy
    redirect_to robots_path, notice: "Robot was successfully deleted."
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :robot_type_id)
  end
end
