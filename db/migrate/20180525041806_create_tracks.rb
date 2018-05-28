class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :track_no
      t.string  :title
      t.string  :writers
      t.string  :length

      t.timestamps
    end
  end
end
