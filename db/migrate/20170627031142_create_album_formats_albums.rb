class CreateAlbumFormatsAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :album_formats_albums do |t|
      t.belongs_to :album,
                   :index => true
      
      t.belongs_to :album_format,
                   :index => true

      t.timestamps
    end
  end
end
