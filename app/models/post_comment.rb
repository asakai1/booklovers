class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :suggest_book

  validates :comment, presence: true

end
