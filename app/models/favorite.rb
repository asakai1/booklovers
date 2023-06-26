class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :suggest_book
end
