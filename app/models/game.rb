class Game < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  # Game.first.users will get u the users who are playing the game
  # Game.first.user willl get the owner
  validates :user, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :platform, presence: true

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
