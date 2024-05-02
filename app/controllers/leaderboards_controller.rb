class LeaderboardsController < ApplicationController
  def index
    @leaderboard = Robot.leaderboard
  end
end
