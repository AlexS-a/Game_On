class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :user_name, presence: true
  mount_uploader :photo, PhotoUploader

end
