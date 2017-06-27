class Album < ApplicationRecord
  has_many :peak_chart_positions

  has_many :album_charts,
           :through => :peak_chart_positions

  has_many :certifications

  has_and_belongs_to_many :album_formats

  validates :title,
            :presence => true

  validates :release_date,
            :presence => true

  validates :label,
            :presence => true
end
