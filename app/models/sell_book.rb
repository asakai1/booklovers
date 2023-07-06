class SellBook < ApplicationRecord
  belongs_to :find_book
  belongs_to :user
  has_one :buy_book

  validates :user_id, presence: true
  validates :find_book_id, presence: true
  validates :price, presence: true
  validates :shipping_date, presence: true

  def bought_by?(sell_book)
    BuyBook.exists?(sell_book_id: sell_book.id)
  end

end
