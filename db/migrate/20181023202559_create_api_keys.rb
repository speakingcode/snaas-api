class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.string :api_key
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
