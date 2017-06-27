class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
      t.belongs_to :album

      t.string     :certifying_body
      t.string     :certification_level

      t.timestamps
    end
  end
end
