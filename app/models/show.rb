class Show < ActiveRecord::Base
  has_many :chars

  # This method generates the parameters we want from the respective shows
  # using tmdb API
  def generate
    if self.name == 'Keeping Up with the Kardashians'
      @kuwtk = Tmdb::TV.detail(14814)
      self.episodes = @kuwtk.number_of_episodes
      self.popularity = @kuwtk.popularity
      self.poster = @kuwtk.poster_path
      self.vote_average = @kuwtk.vote_average
      self.vote_count = @kuwtk.vote_count
      self.save!
    elsif self.name == 'The Bachelorette'
      @bachelorette = Tmdb::TV.detail(1562)
      self.episodes = @bachelorette.number_of_episodes
      self.popularity = @bachelorette.popularity
      self.poster = @bachelorette.poster_path
      self.vote_average = @bachelorette.vote_average
      self.vote_count = @bachelorette.vote_count
      self.save!
    end
  end
end
