# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user for api client
user = User.create!({email: "noone@notrealemail.address", password: "123456", password_confirmation: "123456", confirmed_at: Time.now})

#official client API key
ApiKey.create(user: user)

#album data
certs = {
  :riaa_4x_plat => Certification.create(
    :certifying_body      => 'RIAA',
    :certification_level  => '4x Platinum'
  ),

  :riaa_2x_plat => Certification.create(
    :certifying_body      => 'RIAA',
    :certification_level  => '2x Platinum'
  ),

  :riaa_plat => Certification.create(
    :certifying_body      => 'RIAA',
    :certification_level  => 'Platinum'
  ),

  :bpi_plat => Certification.create(
    :certifying_body      => 'BPI',
    :certification_level  => 'Platinum'
  ),

  :bpi_gold => Certification.create(
    :certifying_body      => 'BPI',
    :certification_level  => 'Gold'
  ),

  :bpi_silver => Certification.create(
    :certifying_body      => 'BPI',
    :certification_level  => 'Silver'
  ),

  :mc_plat => Certification.create(
    :certifying_body      => 'MC',
    :certification_level  => 'Platinum'
  ),

  :mc_gold => Certification.create(
    :certifying_body      => 'MC',
    :certification_level  => 'Gold'
  ),

  :snep_gold => Certification.create(
    :certifying_body      => 'SNEP',
    :certification_level  => 'Gold'
  ),

  :rmnz_gold => Certification.create(
    :certifying_body      => 'RMNZ',
    :certification_level  => 'Gold'
  ),

  :aria_gold => Certification.create(
    :certifying_body      => 'ARIA',
    :certification_level  => 'Gold'
  ),

  :bvmi_gold => Certification.create(
    :certifying_body      => 'BVMI',
    :certification_level  => 'Gold'
  ),

  :ifpi_gold => Certification.create(
    :certifying_body      => 'IFPI SWI',
    :certification_level  => 'Gold'
  ),

  :rianz_gold => Certification.create(
    :certifying_body      => 'RIANZ',
    :certification_level  => 'Gold'
  ),

  :nfpf_gold => Certification.create(
    :certifying_body      => 'NFPF',
    :certification_level  => 'Gold'
  )
}

charts = {
  :us     => AlbumChart.create(:chart => 'US'),
  :usrnb  => AlbumChart.create(:chart => 'US R&B'),
  :aus    => AlbumChart.create(:chart => 'AUS'),
  :bel    => AlbumChart.create(:chart => 'BEL'),
  :can    => AlbumChart.create(:chart => 'CAN'),
  :fra    => AlbumChart.create(:chart => 'FRA'),
  :ger    => AlbumChart.create(:chart => 'GER'),
  :nz     => AlbumChart.create(:chart => 'NZ'),
  :swi    => AlbumChart.create(:chart => 'SWI'),
  :uk     => AlbumChart.create(:chart => 'UK'),
}

formats = {
  :cd       => AlbumFormat.create(format: 'CD'),
  :lp       => AlbumFormat.create(format: 'LP'),
  :cassette => AlbumFormat.create(format: 'Cassette'),
  :digital  => AlbumFormat.create(format: 'Digital Download')
}

Album.create :title         => 'Doggystyle',
             :label         => 'Death Row',
             :release_date  => Date.new(1993, 11, 23),
             :sales         => 7000000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/6/63/SnoopDoggyDoggDoggystyle.jpg",
             :album_formats => formats.values,

             :certifications => [
               certs[:riaa_4x_plat],
               certs[:bpi_plat],
               certs[:mc_plat],
               certs[:snep_gold],
             ],

             :peak_chart_positions => [
               PeakChartPosition.create(
                 :album_chart   => charts[:us],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:usrnb],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:aus],
                 :position => 24
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:can],
                 :position => 10
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:ger],
                 :position => 21
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:nz],
                 :position => 25
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:swi],
                 :position => 24
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:uk],
                 :position => 38
               )
             ]

Album.create :title         => 'The Doggfather',
             :label         => 'Death Row',
             :release_date  => Date.new(1996, 11, 12),
             :sales         => 2000000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/a/a3/Tha-doggfather.jpg",
             :album_formats => formats.values,

             :certifications => [
               certs[:riaa_2x_plat],
               certs[:bpi_gold],
               certs[:mc_plat],
               certs[:rmnz_gold],
             ],

             :peak_chart_positions => [
               PeakChartPosition.create(
                 :album_chart   => charts[:us],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:usrnb],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:aus],
                 :position => 12
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:bel],
                 :position => 45
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:can],
                 :position => 2
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:fra],
                 :position => 9
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:ger],
                 :position => 23
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:nz],
                 :position => 6
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:swi],
                 :position => 41
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:uk],
                 :position => 15
               )
             ]

Album.create :title         => 'Da Game Is to Be Sold, Not to Be Told',
             :label         => 'No Limit',
             :release_date  => Date.new(1998, 8, 4),
             :sales         => 2085000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/c/c5/Gameistobesold.jpg",
             :album_formats => formats.values,

             :certifications => [
               certs[:riaa_2x_plat],
               certs[:bpi_silver],
               certs[:mc_plat]
             ],

             :peak_chart_positions => [
               PeakChartPosition.create(
                 :album_chart   => charts[:us],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:usrnb],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:aus],
                 :position => 14
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:can],
                 :position => 4
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:fra],
                 :position => 44
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:ger],
                 :position => 24
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:nz],
                 :position => 11
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:swi],
                 :position => 50
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:uk],
                 :position => 28
               )
             ]

Album.create :title         => 'No Limit Top Dogg',
             :label         => 'No Limit',
             :release_date  => Date.new(1999, 5, 11),
             :sales         => 1518000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/d/d1/Snoop_front.JPG",
             :album_formats => formats.values,

             :certifications => [
               certs[:riaa_plat],
               certs[:bpi_silver],
               certs[:mc_plat]
             ],

             :peak_chart_positions => [
               PeakChartPosition.create(
                 :album_chart   => charts[:us],
                 :position => 2
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:usrnb],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:aus],
                 :position => 48
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:can],
                 :position => 10
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:fra],
                 :position => 53
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:ger],
                 :position => 46
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:nz],
                 :position => 25
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:uk],
                 :position => 48
               )
             ]

Album.create :title         => 'The Last Meal',
             :label         => 'No Limit',
             :release_date  => Date.new(2000, 12, 19),
             :sales         => 2068000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/d/dc/The_Last_Meal_-_Front.jpeg",
             :album_formats => formats.values,

             :certifications => [
               certs[:riaa_plat],
               certs[:bpi_gold],
               certs[:mc_plat],
               certs[:snep_gold],
             ],

             :peak_chart_positions => [
               PeakChartPosition.create(
                 :album_chart   => charts[:us],
                 :position => 4
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:usrnb],
                 :position => 1
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:aus],
                 :position => 38
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:bel],
                 :position => 47
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:can],
                 :position => 15
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:fra],
                 :position => 13
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:ger],
                 :position => 55
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:nz],
                 :position => 19
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:swi],
                 :position => 81
               ),
               PeakChartPosition.create(
                 :album_chart   => charts[:uk],
                 :position => 62
               )
             ]

