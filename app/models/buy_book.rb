class BuyBook < ApplicationRecord

  belongs_to :sell_book
  belongs_to :user

  enum payment_method: { cash_on_delivery: 0 }
end
