class AddPhotoToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :photo, :string
  end
end
