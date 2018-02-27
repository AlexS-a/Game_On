class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :rent_start, presence: true
  validates :rent_end, presence: true
  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :status, inclusion: {in: %w(pending, declined, accepted)}


  def accept_booking
    self.status = "accepted"
  end

  def declined_booking
    self.status = "declined"
  end
end
