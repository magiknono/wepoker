class GameParticipationsController < ApplicationController
  def create
    @pokergame = PokerGame.find(params[:poker_game_id])
    @game_participation = current_user.game_participations.create({
      poker_game: @pokergame,
      answered_at: DateTime.now
    })
  end

  def update

  end

  def accept

  end

end