class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :rent_start
      t.date :rent_end
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
