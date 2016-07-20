class MatchUser
  attr_accessor :user_params

  def initialize(user_params)
    @user_params = user_params
  end

  # Match the user with another user in the same league. Restrictions are that
  # the matched user shouldn't have the same id as the current user and should
  # be in the same league as the current user
  def match(opponent)
    return false if user_params[:matched] == true
    @unmatched_users = User.where(matched: false)
    @unique_unmatched_users = @unmatched_users.where.not(id: user_params[:id])
    @same_league_unmatched_users = @unique_unmatched_users.where(league_id:
    user_params[:league_id])
    return false if @same_league_unmatched_users.empty?
    opponent = @same_league_unmatched_users.sample
    opponent.faceoff_date = Time.now
    user_params[:faceoff_date] = Time.now
    # FOR TESTING PURPOSED MATCHED IS NOT SET TO TRUE AFTER MATCHING TWO PLAYERS
    # opponent.matched = true
    # user_params[:matched] = true
    opponent
  end
end
