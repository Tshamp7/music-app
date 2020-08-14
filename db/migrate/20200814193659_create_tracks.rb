class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :track_number, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.timestamps
    end
  end
end
