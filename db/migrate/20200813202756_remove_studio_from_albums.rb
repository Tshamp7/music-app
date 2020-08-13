class RemoveStudioFromAlbums < ActiveRecord::Migration[6.0]
  def change
    remove_column :albums, :studio
    add_column :albums, :album_type, :string, null: false
  end
end
