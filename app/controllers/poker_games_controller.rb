class PokerGamesController < ApplicationController
  before_action :need_profile_completed, only: [:new, :my_poker_games]
  def index
    # @pokergames = PokerGame.all.paginate(page: params[:page], per_page: 2)
    @pokergames = PokerGame.all_but(current_user)
    @pokergames = @pokergames.near(params[:q],params[:km]) if params[:q]
    @pokergames = @pokergames.paginate(page: params[:page], per_page: 2)
    # @pokergames_near = PokerGame.all.near
    return render partial: 'list_games', locals: {pokergames: @pokergames} if request.xhr?

  end

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

  def destroy
    PokerGame.find(params[:id]).destroy
    redirect_to my_poker_games_path
  end

   def pokergame_params
    params.require(:poker_game).permit(:date, :hour, :description,:nb_players_required, :gametype, :street_address, :zipcode_address, :city_address,:lat,:lng)
  end

  private

  def need_profile_completed
    @user = User.find(current_user.id)
     if (@user.birthday || @user.phone || @user.name) == nil
      redirect_to edit_user_path(current_user.id)
     end
  end
end
