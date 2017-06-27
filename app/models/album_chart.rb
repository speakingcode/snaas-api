class AlbumChart < ApplicationRecord
  has_many :peak_chart_positions

  has_many :albums,
           :through => :peak_chart_positions
end
