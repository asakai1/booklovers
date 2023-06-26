class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :suggest_book
end
