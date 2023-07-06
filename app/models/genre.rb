class Genre < ApplicationRecord
  has_many :find_books, dependent: :destroy
  has_many :suggest_books, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
