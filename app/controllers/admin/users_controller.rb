class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 会員の投稿を全て取得
    @favorites = @user.favorites
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user), notice: "会員情報の更新に成功しました。"
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end
