class ProfilesController < ApplicationController
  def index
    @user_profile_id = params[:id]
    @user = User.where(id:@user_profile_id)
    @user_league = League.find_by(id: @user[0][:league_id])
    @current_team = @user[0].teams.last
    @user_cast = @current_team.chars
    @access_key = @user_league.access_key
  end

  def history
  end

  def stats
    @user = current_user
    @user_score = @user.score
  end

  def cast
    @current_team = current_user.teams.last
    @stars = @current_team.chars
  end
end
