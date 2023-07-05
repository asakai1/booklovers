class FindBook < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :sell_books, dependent: :destroy
  has_many :post_informations, dependent: :destroy

  def self.looks(searches, words)
    if searches == "perfect_match"
      @find_book = FindBook.where("title LIKE ?", "#{words}")
    else
      @find_book = FindBook.where("title LIKE ?", "%#{words}%")
    end
  end

  validates :user_id, presence: true
  validates :genre_id, presence: true
  validates :title, presence: true, length: {maximum: 30 }
  validates :body, presence: true, length: {maximum: 400 }

end
