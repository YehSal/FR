class CharTeamThrough < ActiveRecord::Base
  belongs_to :char
  belongs_to :team
end
