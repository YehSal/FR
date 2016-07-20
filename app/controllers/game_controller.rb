class GameController < ApplicationController
  def index
    # 
    # Match current user with another user in the same league unless current
    # user is already matched or no user is available
    @user = current_user

    if @user.is_on_team? == false
      redirect_to new_team_path
    end

    @matching = MatchUser.new(@user)
    if @matching.match(@matched_user)
      @matched_user = @matching.match(@matched_user)
      @matched_user_team = @matched_user.teams.last.chars
    end
    # If user already picked a team, update their show's score and then
    # calculate the score of each star on the team after resetting their score
    # to zero
    if @user.is_on_team? == true
      @user.score = 0
      @matched_user.score = 0
      # Score for current user
      @current_team = current_user.teams.last.chars
      @current_team.each do |i|
        if i.show == 'Keeping Up with the Kardashians'
          @show = Show.where(name: 'Keeping Up with the Kardashians')
          @show = @show.first
          @show.generate
        elsif i.show == 'The Bachelorette'
          @show = Show.where(name: 'The Bachelorette')
          @show = @show.first
          @show.generate
        else
          flash[:alert] = "Show doesn't exist!"
        end
        @current_user_all_params = CalculateScore.new(i, @show, @user)
        @current_user_char_score = @current_user_all_params.calculate
        @user.score += @current_user_char_score
      end
      # Score for matched user
      @matched_user_team.each do |i|
        if i.show == 'Keeping Up with the Kardashians'
          @show = Show.where(name: 'Keeping Up with the Kardashians')
          @show = @show.first
        elsif i.show == 'The Bachelorette'
          @show = Show.where(name: 'The Bachelorette')
          @show = @show.first
          @show.generate
        else
          flash[:alert] = "Show doesn't exist!"
        end
        @all_params = CalculateScore.new(i, @show, @user)
        @char_score = @all_params.calculate
        @user.score += @char_score
        @user.save!
        @matched_user_all_params = CalculateScore.new(i, @show, @matched_user)
        @matched_user_char_score = @matched_user_all_params.calculate
        @matched_user.score += @matched_user_char_score
      end
      @matched_user.save!
    end
    # TBI
    # Check when user was last matched with another user
    # if User.two_weeks_since_last_faceoff?(@user)
    #   flash[:notice] = "Choose your team for the new round!"
    #   redirect_to :controller => "teams", :action => "new"
    # end
  end

  def leaderboard
    @all_users = User.all
    @user = current_user
    @user_league = League.find(@user.league_id)
    @rank_counter = 0
  end
end
