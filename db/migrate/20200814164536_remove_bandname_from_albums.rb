class RemoveBandnameFromAlbums < ActiveRecord::Migration[6.0]
  def change
    remove_column :albums, :band_name
  end
end
