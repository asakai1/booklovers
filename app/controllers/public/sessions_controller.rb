# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # 退会済みのアカウントでログインできないように設定
  before_action :user_state, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストとしてログインしました'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def user_state
    # 入力されたemailからアカウントを1件取得
    @user = User.find_by(name: params[:user][:name])
    # アカウントを取得できなかった場合は処理を終了する
    return if !@user
      # 取得したアカウントのパスワードと一致しているかを確認
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
        # 新規登録画面へ遷移させる
        redirect_to new_user_registration_path, notice: '退会済みのアカウントです。再度ご登録ください。'
      end
  end
end
