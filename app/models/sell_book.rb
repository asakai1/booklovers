class SellBook < ApplicationRecord
  belongs_to :find_book
  belongs_to :user
  has_one :buy_book, dependent: :destroy

  validates :user_id, presence: true
  validates :find_book_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :shipping_date, presence: true

  def bought?(sell_book)
    BuyBook.exists?(sell_book_id: sell_book.id)
  end

end
