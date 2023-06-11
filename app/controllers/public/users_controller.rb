class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user), notice: '会員情報を更新しました'
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path, notice: 'アカウントを削除しました'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end
