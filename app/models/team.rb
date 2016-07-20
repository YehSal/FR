class Team < ActiveRecord::Base
  belongs_to :user
  has_many :char_team_throughs
  has_many :chars, through: :char_team_throughs
end
