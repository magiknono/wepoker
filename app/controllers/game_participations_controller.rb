class GameParticipationsController < ApplicationController
  def create
    @pokergame = PokerGame.find(params[:poker_game_id])
    @game_participation = current_user.game_participations.create({
      poker_game: @pokergame,
      answered_at: DateTime.now
    })
    return render json: {status: 'OK', message: 'Successfully joined game', button_text: 'Liked'}
  end
end