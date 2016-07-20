class Char < ActiveRecord::Base
  # Keeping Up with the kardashians id = 14814
  # Tmdb::TV.detail(355)[:vote_average]

  # The Bachelorette id = 1562
  # Tmdb::TV.detail(1562)[:vote_average]
  has_many :char_team_throughs
  has_many :shows
  has_many :teams, through: :char_team_throughs

  # The Bachelor info
  @kuwtk = Tmdb::TV.detail(14814)
  @kuwtk_total_episodes = @kuwtk.total_episodes
  @kuwtk_popularity = @kuwtk.popularity
  @kuwtk_poster = @kuwtk.poster_path
  @kuwtk_vote_average = @kuwtk.vote_average
  @kuwtk_vote_count = @kuwtk.vote_count

  # The Bachelorette info
  @bachelorette = Tmdb::TV.detail(1562)
  @bachelorette_total_episodes = @bachelorette.total_episodes
  @bachelorette_popularity = @bachelorette.popularity
  @bachelorette_poster = @bachelorette.poster_path
  @bachelorette_vote_average = @bachelorette.vote_average
  @bachelorette_vote_count = @bachelorette.vote_count

  # def is_on_team?(char)
  #   if char.teams.last.nil?
  #     return 'true'
  #   else
  #     return 'false'
  #   end
  # end

end
