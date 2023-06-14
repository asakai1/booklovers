class SuggestBook < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  def self.looks(searches, words)
    if searches == "perfect_match"
      @suggest_book = SuggestBook.where("title LIKE ?", "#{words}")
    else
      @suggest_book = SuggestBook.where("title LIKE ?", "%#{words}%")
    end
  end
end
