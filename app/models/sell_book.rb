class SellBook < ApplicationRecord
  belongs_to :find_book
  belongs_to :user
  has_one :buy_book

end
