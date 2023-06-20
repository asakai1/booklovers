class FindBook < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :sell_books, dependent: :destroy

  def self.looks(searches, words)
    if searches == "perfect_match"
      @find_book = FindBook.where("title LIKE ?", "#{words}")
    else
      @find_book = FindBook.where("title LIKE ?", "%#{words}%")
    end
  end
end
