class Game < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  # Game.first.users will get u the users who are playing the game
  # Game.first.user will get the owner
  # validates :user, presence: true # Potentially breaks
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :platform, presence: true
end
