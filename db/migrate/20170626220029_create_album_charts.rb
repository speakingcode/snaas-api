class CreateAlbumCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :album_charts do |t|
      t.string :chart

      t.timestamps
    end
  end
end
