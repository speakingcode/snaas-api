class CreateNicknames < ActiveRecord::Migration[5.1]
  def change
    create_table :nicknames do |t|

      t.timestamps
    end
  end
end
