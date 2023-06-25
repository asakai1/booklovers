class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 探す・おすすめ投稿との関連付け
  has_many :find_books, dependent: :destroy
  has_many :suggest_books, dependent: :destroy
  has_many :sell_books, dependent: :destroy
  has_many :buy_books, dependent: :destroy

  # プロフィール画像用にactivestrageを追加
  has_one_attached :profile_image

  def get_profile_image(width,height)
    # プロフィール画像が設定されていない場合のデフォルト画像を設定
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像サイズを引数で設定
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # ゲストアカウントを使用、または作成
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      # パスワードはランダム文字列で作成
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
  end


end
