class CreateAlbumFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :album_formats do |t|
      t.string :format

      t.timestamps
    end
  end
end
