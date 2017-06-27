class PeakChartPosition < ApplicationRecord
  belongs_to :album
  
  belongs_to :album_chart

  validates :position,
            :presence => true
end
