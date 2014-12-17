class GameParticipationsController < ApplicationController
  def create
    @pokergame = PokerGame.find(params[:poker_game_id])
    @game_participation = current_user.game_participations.create({
      poker_game: @pokergame,
      answered_at: DateTime.now
    })
  end

  def update
    @pokergame = PokerGame.find(params[:poker_game_id])
    @gameparticipation_id = GameParticipation.find(params[:id])
    @game_participation = @gameparticipation_id.update({
      poker_game: @pokergame,
      is_accepted: true
      })

  end



end