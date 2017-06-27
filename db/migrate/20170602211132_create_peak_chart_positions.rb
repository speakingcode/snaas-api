class CreatePeakChartPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :peak_chart_positions do |t|
      t.belongs_to  :album_chart
      t.belongs_to  :album
      t.integer     :position

      t.timestamps
    end
  end
end
