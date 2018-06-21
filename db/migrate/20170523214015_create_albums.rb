class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string  :title
      t.string  :label
      t.date    :release_date
      t.integer :sales
      t.string  :cover_artwork_url

      t.timestamps
    end
  end
end
