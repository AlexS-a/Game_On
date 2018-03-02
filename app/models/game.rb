class Game < ApplicationRecord
  GENRES = ['Survival', 'RPG' 'MMORPG', 'VRMMORPG', 'Puzzle', 'Beat em Up', 'Simulation', 'Racing', 'Sports', 'Fighting', 'Hack n Slash', 'Sandbox', 'Stealth', '
Tower Defense', 'Battle Royale', 'Horror']
  PLATFORMS = ['PS4' , 'XB1', 'Steam(PC)']

  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews
  # Game.first.users will get u the users who are playing the game
  # Game.first.user will get the owner
  # validates :user, presence: true # Potentially breaks
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :platform, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
    against: [:name, :description, :genre, :location, :platform, :price],
    using: {
         tsearch: { prefix: true }
       }

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
