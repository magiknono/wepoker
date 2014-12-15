class GameParticipation < ActiveRecord::Base
  belongs_to :user
  belongs_to :poker_game


end