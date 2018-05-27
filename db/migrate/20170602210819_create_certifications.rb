class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
      t.string     :certifying_body
      t.string     :certification_level

      t.timestamps
    end
  end
end
