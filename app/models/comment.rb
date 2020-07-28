class Comment < ApplicationRecord
  validates :text, presence: true, length: {maximum: 200}

  # アソシエーション
  belongs_to :user
  belongs_to :post
end
