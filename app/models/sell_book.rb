class SellBook < ApplicationRecord
  belongs_to :find_book
  belongs_to :user
  has_one :buy_book

  def bought_by?(sell_book)
    BuyBook.exists?(sell_book_id: sell_book.id)
  end

end
