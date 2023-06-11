class Public::UsersController < ApplicationController

  # 会員詳細ページ・マイページ
  def show
    @user = User.find(params[:id])
  end

  # 会員情報の編集
  def edit
    @user = current_user
  end

  # 会員情報の更新
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user), notice: '会員情報を更新しました'
  end

  # 退会処理
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: '退会処理が完了しました。ご利用ありがとうございました!'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end
