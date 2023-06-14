class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params_user)
    redirect_to user_path(@user.id), notice: "会員情報の更新に成功しました。"

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end
