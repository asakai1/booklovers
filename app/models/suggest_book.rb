class SuggestBook < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :user_id, presence: true
  validates :genre_id, presence: true
  validates :title, presence: true, length: {maximum: 30 }
  validates :body, presence: true, length: {maximum: 400 }

  def self.looks(searches, words)
    if searches == "perfect_match"
      @suggest_book = SuggestBook.where("title LIKE ?", "#{words}")
    else
      @suggest_book = SuggestBook.where("title LIKE ?", "%#{words}%")
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
