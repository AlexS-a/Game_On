class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.string :location
      t.string :platform
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
