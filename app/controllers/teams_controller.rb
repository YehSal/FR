class TeamsController < ApplicationController
  def index
    @my_cast = params[:char_ids]

    # mycast.each do |i|
    #   @selected_chars_through = CharTeamThrough.new
    #   @selected_chars_through.team_id = current_user.id
    #   @selected_chars_through.char_id = i
  end

  def new
    @user = current_user
    if !@user.is_on_team?
      @team_form = Team.new
    else
      flash[:alert] = "You already have a team!"
      redirect_to game_index_path
    end
  end

  def create
    team_hash = params.delete(:team)
    @team = Team.new
    @team.name = team_hash[:name]
    @team.user = current_user
    @team.save!

    redirect_to team_path(@team)
  end

  def show
    @chars = Char.all
  end

  def select_chars
    @my_cast = params[:char_ids]

    if @my_cast.size != 5
      flash[:alert] = "You need to pick 5 stars!"
      redirect_to(:back)
    else
      @current_team = current_user.teams.last

      @my_cast.each do |char_id|
        @char = Char.find(char_id)
        @current_team.chars << @char
      end

      @current_team.save!
      redirect_to :controller => "leagues", :action => "index"
    end
  end

  def updated

  end
end
