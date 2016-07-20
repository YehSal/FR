class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :teams
  belongs_to :league
  after_initialize :init

  # initialize values for user model
  def init
    self.matched = false if self.matched.nil?
    self.score ||= 0.0
    self.media_update ||= (DateTime.now - 1.day).utc
  end

  def is_on_team?
    if self.teams.last.nil?
      return false
    else
      return true
    end
  end

  def is_on_league?
    if self.league_id.nil?
      return false
    else
      return true
    end
  end


  #TBI
  # def self.two_weeks_since_last_faceoff?(user)
  #   @time = Time.now
  #   @t = user.teams.last
  #   # Time in days
  #   if (@time - user.faceoff_date)/86400 >= 14
  #     user.matched = false
  #     user.teams.delete(@t)
  #     return true
  #   else
  #     return false
  #   end
  # end

end
