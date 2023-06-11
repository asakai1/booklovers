class Genre < ApplicationRecord
  has_many :find_books, dependent: :destroy
end
