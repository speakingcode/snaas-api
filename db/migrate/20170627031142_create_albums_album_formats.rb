class CreateAlbumsAlbumFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :albums_album_formats do |t|
      t.belongs_to :album,
                   :index => true
      
      t.belongs_to :album_format,
                   :index => true
    end
  end
end
