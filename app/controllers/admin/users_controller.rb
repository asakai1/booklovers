class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 会員の投稿を全て取得
    @find_books = @user.find_books.all
    @suggest_books = @user.suggest_books.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params_user)
    redirect_to user_path(@user.id), notice: "会員情報の更新に成功しました。"
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end
