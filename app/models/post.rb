class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :text, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    if search
      Post.where('title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end
end
