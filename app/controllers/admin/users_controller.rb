class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 会員の投稿を全て取得
    @favorites = @user.favorites
    @sell_books = @user.sell_books
    @buy_books = @user.buy_books
    @post_informations = @user.post_informations
    @post_comments = @user.post_comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "会員情報の更新に成功しました。"
    else
      render 'edit'
    end
  end

  # 退会処理
  def destroy
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_user_path(@user), notice: "会員を退会済みに変更しました"
  end

  def activate
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    redirect_to admin_user_path(@user), notice: "会員を有効に変更しました"
  end

  def user_params
    params.require(:user).permit(%i[name email introduction profile_image is_deleted])
  end

end
