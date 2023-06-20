class SellBook < ApplicationRecord
  belongs_to :find_book
  belongs_to :user
end
