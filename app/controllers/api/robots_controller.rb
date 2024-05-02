class Api::RobotsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    robots_body = JSON.parse(request.body.read)

    if robots_body.is_a?(Array)
      robots_body.each do |robot_params|
        robot = Robot.new(robot_params)
        if robot.save
          puts "Robot #{robot.name} created successfully"
        else
          puts "Error creating robot: #{robot.errors.full_messages.join(", ")}"
        end
      end
      render json: { message: "Robots created successfully" }, status: :created
    else
      render json: { error: "Invalid JSON format" }, status: :unprocessable_entity
    end
  end
end
