class Public::UsersController < ApplicationController

  # 会員詳細ページ・マイページ
  def show
    @user = User.find(params[:id])
    # 会員の投稿を全て取得
    @find_books = @user.find_books
    @suggest_books = @user.suggest_books
    @favorites = current_user.favorites
    @sell_books = current_user.sell_books
    @buy_books = current_user.buy_books
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
    params.require(:user).permit(%i[name email introduction profile_image])
  end

end
