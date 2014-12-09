class PokerGamesController < ApplicationController
  def show
    @pokergame = PokerGame.find(params[:id])
  end
  def new
    @pokergame = PokerGame.new

  end
  def create
    @pokergame = PokerGame.new(pokergame_params)
    @pokergame.user = current_user
    @pokergame.save
    redirect_to poker_game_path(@pokergame)
  end

   def pokergame_params
    params.require(:poker_game).permit(:date, :hour, :description,:nb_players_required,:gametype)
  end
end
