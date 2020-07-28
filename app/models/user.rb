class User < ApplicationRecord
  mount_uploader :image, UserImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
  validates :profile, length: {maximum: 100}

  has_many :posts
  has_many :comments
  has_many :likes
end
