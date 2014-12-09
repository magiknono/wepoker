class UsersController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:name, :phone, :birthday)
  end
end
