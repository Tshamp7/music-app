class ChangeAlbumYearToString < ActiveRecord::Migration[6.0]
  def change
    change_column :albums, :year, :string
  end
end
