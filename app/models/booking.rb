class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :rent_start, presence: true
  validates :rent_end, presence: true
  validates :game_id, presence: true
  validates :user_id, presence: true
end
