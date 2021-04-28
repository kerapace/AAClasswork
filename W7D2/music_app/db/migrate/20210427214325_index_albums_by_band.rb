class IndexAlbumsByBand < ActiveRecord::Migration[5.2]
  def change
    
    add_column :albums, :title, :string, null: false
    add_column :albums, :year, :integer, null: false
    add_column :albums, :recording_type, :string
    add_column :albums, :band_id, :integer, null: false

    add_index :albums, :band_id
  end
end
