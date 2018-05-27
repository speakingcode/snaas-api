class CreateAlbumsCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :albums_certifications do |t|
      t.belongs_to  :albums,
                    :index => true

      t.belongs_to  :certifications,
                    :index => true
    end
  end
end
