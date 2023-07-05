class BuyBook < ApplicationRecord

  belongs_to :sell_book
  belongs_to :user

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :payment_method, presence: true

  enum payment_method: { cash_on_delivery: 0 }
end
