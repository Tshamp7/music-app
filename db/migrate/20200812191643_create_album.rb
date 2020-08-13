class CreateAlbum < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :band_id, null: false
      t.boolean :studio, default: true
      t.timestamps
    end
  end
end
