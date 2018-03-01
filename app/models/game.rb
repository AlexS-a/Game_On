class Game < ApplicationRecord
  GENRES = ['Action/Shooter', 'Action/Platform', 'Action/Fighting', 'Action/BeatemUps']
  PLATFORMS = ['PS4' , 'XB1', 'Steam(PC)']

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
  mount_uploader :photo, PhotoUploader

  # test
  # validates_uniqueness_of :genre, :scope => [:games]


  def find_icon
    if self.platform == 'Steam(PC)'
      "fab fa-steam-symbol"
    elsif self.platform == 'PS4'
      "fab fa-playstation"
    elsif self.platform == 'XB1'
      "fab fa-xbox"
    end
  end
end
