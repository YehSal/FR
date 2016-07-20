class LeaguesController < ApplicationController

  def index
    @leaguespub = League.where(access_key: nil).pluck(:name, :id)

    @user_league = current_user
  end

  def new

  end

  def join

  end

  def leaguesubmit
    @user = current_user

    if !@user.is_on_league?
      @user.league_id = params["league_id"].to_i
      @user.save!
      redirect_to game_index_path
    else
      flash[:alert] = "You are already in a league!"
      redirect_to game_index_path
    end
  end

  def newprivate
    @user = current_user
    if !@user.is_on_league?
      priv_league = League.new
      priv_league.name = params["name"]
      priv_league.access_key = SecureRandom.uuid
      priv_league.save!
      @user.league_id = priv_league.id
      @user.save!
      redirect_to game_index_path
    else
      flash[:alert] = "You are already in a league!"
      redirect_to game_index_path
    end
  end

  def joinprivate
    key_check = params['access_key']
    private_leagues = League.find_by(access_key: key_check)
    if private_leagues.nil?
      flash[:alert] = "Invalid access key. Please try again"
      redirect_to leagues_join_path
    else
      current_user.league_id = private_leagues.id
      current_user.save!
      flash[:notice] = "Successfully joined league!"
      redirect_to game_index_path
    end
  end

end
