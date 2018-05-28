class CreateAlbumsCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :albums_certifications do |t|
      t.belongs_to  :album,
                    :index => true

      t.belongs_to  :certification,
                    :index => true
    end
  end
end
