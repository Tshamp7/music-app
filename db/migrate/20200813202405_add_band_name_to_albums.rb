class AddBandNameToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :band_name, :string
    change_column :albums, :studio, :string
  end
end
