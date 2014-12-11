class PokerGamesController < ApplicationController
  def show
    @pokergame = PokerGame.find(params[:id])
  end
  def new
    @pokergame = PokerGame.new


  end
  def create
    if @pokergame = current_user.poker_games.create(pokergame_params)
      redirect_to poker_game_confirm_add_path(@pokergame)
    else
      render :new, alert: @pokergame.errors.full_messages.join('<br />')
    end
  end

  def confirm_add
    @pokergame = PokerGame.find(params[:poker_game_id])
  end

  def my_poker_games
    @my_poker_games = current_user.poker_games.all
  end

   def pokergame_params
    params.require(:poker_game).permit(:date, :hour, :description,:nb_players_required, :gametype, :street_address, :zipcode_address, :city_address,:lat,:lng)
  end
end
