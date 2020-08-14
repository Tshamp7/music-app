class AddTypeToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :track_type, :string, null: false
  end
end
