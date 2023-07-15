class PostInformation < ApplicationRecord
  belongs_to :user
  belongs_to :find_book

  validates :information, presence: true

end
