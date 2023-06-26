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

  with_options presence: true, on: :publicize do
    validates :title
    validates :body
  end
  validates :title, length: {maximum: 30 }, on: :publicize
  validates :body, length: {maximum: 400 }, on: :publicize
end
