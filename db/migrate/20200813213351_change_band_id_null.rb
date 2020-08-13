class ChangeBandIdNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :albums, :band_id, true
  end
end
