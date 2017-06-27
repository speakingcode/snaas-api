class CreateAlbumCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :album_charts do |t|
      t.string :label

      t.timestamps
    end
  end
end
