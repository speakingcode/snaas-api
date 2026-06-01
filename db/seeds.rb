user = User.create!({email: "noone@notrealemail.address", password: "123456", password_confirmation: "123456", confirmed_at: Time.now})
ApiKey.skip_callback(:create, :before, :set_api_key)
key = ApiKey.create(
  :user    => user,
  :api_key => ENV['SNAAS_UI_SNAAS_API_KEY']
)
ApiKey.set_callback(:create, :before, :set_api_key)
puts "SnaaS UI API key created: #{key.api_key}"

certs = {
  :riaa_4x_plat => Certification.create(:certifying_body => 'RIAA', :certification_level => '4x Platinum'),
  :riaa_2x_plat => Certification.create(:certifying_body => 'RIAA', :certification_level => '2x Platinum'),
  :riaa_plat => Certification.create(:certifying_body => 'RIAA', :certification_level => 'Platinum'),
  :riaa_gold => Certification.create(:certifying_body => 'RIAA', :certification_level => 'Gold'),
  :bpi_plat => Certification.create(:certifying_body => 'BPI', :certification_level => 'Platinum'),
  :bpi_gold => Certification.create(:certifying_body => 'BPI', :certification_level => 'Gold'),
  :bpi_silver => Certification.create(:certifying_body => 'BPI', :certification_level => 'Silver'),
  :mc_plat => Certification.create(:certifying_body => 'MC', :certification_level => 'Platinum'),
  :mc_gold => Certification.create(:certifying_body => 'MC', :certification_level => 'Gold'),
  :snep_gold => Certification.create(:certifying_body => 'SNEP', :certification_level => 'Gold'),
  :rmnz_plat => Certification.create(:certifying_body => 'RMNZ', :certification_level => 'Platinum'),
  :rmnz_gold => Certification.create(:certifying_body => 'RMNZ', :certification_level => 'Gold'),
  :aria_gold => Certification.create(:certifying_body => 'ARIA', :certification_level => 'Gold'),
  :bvmi_gold => Certification.create(:certifying_body => 'BVMI', :certification_level => 'Gold'),
  :ifpi_gold => Certification.create(:certifying_body => 'IFPI SWI', :certification_level => 'Gold'),
  :rianz_plat => Certification.create(:certifying_body => 'RIANZ', :certification_level => 'Platinum'),
  :nfpf_gold => Certification.create(:certifying_body => 'NFPF', :certification_level => 'Gold'),
}

charts = {
  :us => AlbumChart.create(:chart => 'US'),
  :usrnb => AlbumChart.create(:chart => 'US R&B'),
  :aus => AlbumChart.create(:chart => 'AUS'),
  :bel => AlbumChart.create(:chart => 'BEL'),
  :can => AlbumChart.create(:chart => 'CAN'),
  :fra => AlbumChart.create(:chart => 'FRA'),
  :ger => AlbumChart.create(:chart => 'GER'),
  :nz => AlbumChart.create(:chart => 'NZ'),
  :swi => AlbumChart.create(:chart => 'SWI'),
  :uk => AlbumChart.create(:chart => 'UK'),
}

formats = {
  :cd => AlbumFormat.create(format: 'CD'),
  :lp => AlbumFormat.create(format: 'LP'),
  :cassette => AlbumFormat.create(format: 'Cassette'),
  :digital => AlbumFormat.create(format: 'Digital Download'),
}

# 1. Doggystyle
album = Album.create :title => 'Doggystyle',
             :label => 'Death Row/Interscope',
             :release_date => Date.new(1993, 11, 23),
             :sales => 6957800,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/6/63/SnoopDoggyDoggDoggystyle.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:cassette], formats[:digital]],
             :certifications => [certs[:riaa_4x_plat], certs[:bpi_plat], certs[:mc_plat], certs[:rmnz_plat], certs[:snep_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 24),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 10),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 21),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 25),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 24),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 38)
             ]
album.tracks.create([
  { :track_no => 1, :title => 'Bathtub', :writers => 'Calvin Broadus, Andre Young, Curtis Mayfield', :length => '1:50' },
  { :track_no => 2, :title => 'G Funk Intro', :writers => 'Broadus, Young, Robin Allen, George Clinton, Philippe Wynn', :length => '2:24' },
  { :track_no => 3, :title => 'Gin and Juice', :writers => 'Broadus, Young, Harry Wayne Casey, Richard Finch, Delmar Arnaud, Steve Arrington, Mark Adams, Raymond Turner, Daniel Webster, Stephen Washington', :length => '3:31' },
  { :track_no => 4, :title => 'W Balls', :writers => 'Broadus', :length => '0:36' },
  { :track_no => 5, :title => 'Tha Shiznit', :writers => 'Broadus, Young', :length => '4:04' },
  { :track_no => 6, :title => 'Domino Intro', :writers => 'Broadus', :length => '0:37' },
  { :track_no => 7, :title => 'Lodi Dodi', :writers => 'Broadus, Young, Douglas Davis, Ricky Walters', :length => '4:24' },
  { :track_no => 8, :title => 'Murder Was the Case', :writers => 'Broadus, Young, Delmar Arnaud, Warren Griffin, Rojai Trawick', :length => '3:38' },
  { :track_no => 9, :title => 'Serial Killa', :writers => 'Broadus, Young, Arnaud, Ricardo Brown, Robin Allen', :length => '4:43' },
  { :track_no => 10, :title => 'Who Am I? (What\'s My Name?)', :writers => 'Broadus, Young, George Clinton, Bernie Worrell, David Spradley, Garry Shider, William Collins, Jerome Brailey, Mose Davis', :length => '4:06' },
  { :track_no => 11, :title => 'For All My Niggaz & Bitches', :writers => 'Broadus, Young, Arnaud, Brown, Allen', :length => '4:43' },
  { :track_no => 12, :title => 'Ain\'t No Fun (If the Homies Can\'t Have None)', :writers => 'Broadus, Young, Brown, Griffin, Nathaniel Hale', :length => '4:06' },
  { :track_no => 13, :title => 'Chronic Relief Intro', :writers => 'Broadus', :length => '0:33' },
  { :track_no => 14, :title => 'Doggy Dogg World', :writers => 'Broadus, Young, Arnaud, Brown, Richard Fields, Belinda Wilson', :length => '5:05' },
  { :track_no => 15, :title => 'Class Room Intro', :writers => 'Broadus', :length => '0:44' },
  { :track_no => 16, :title => 'Gz and Hustlas', :writers => 'Broadus, Young, Arnaud, Don Blackman', :length => '3:51' },
  { :track_no => 17, :title => 'Checkin\'', :writers => 'Broadus, Young', :length => '0:57' },
  { :track_no => 18, :title => 'Gz Up, Hoes Down', :writers => 'Broadus, Young, Arnaud', :length => '2:21' },
  { :track_no => 19, :title => 'Pump Pump', :writers => 'Broadus, Young, Lamorris Edwards', :length => '3:42' }
])

# 2. The Doggfather
album = Album.create :title => 'The Doggfather',
             :label => 'Death Row/Interscope',
             :release_date => Date.new(1996, 11, 12),
             :sales => 2000000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/a/a3/Tha-doggfather.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:cassette], formats[:digital]],
             :certifications => [certs[:riaa_2x_plat], certs[:bpi_gold], certs[:mc_plat], certs[:rmnz_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 12),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 45),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 2),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 9),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 23),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 6),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 41),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 15)
             ]
album.tracks.create([
  { :track_no => 1, :title => 'Intro', :writers => '', :length => '0:46' },
  { :track_no => 2, :title => 'Doggfather', :writers => 'Calvin Broadus', :length => '3:57' },
  { :track_no => 3, :title => 'Ride 4 Me', :writers => 'Broadus', :length => '1:01' },
  { :track_no => 4, :title => 'Up Jump tha Boogie', :writers => 'Broadus, Ricardo Brown', :length => '4:43' },
  { :track_no => 5, :title => 'Freestyle Conversation', :writers => 'Broadus', :length => '4:17' },
  { :track_no => 6, :title => 'When I Grow Up', :writers => 'Broadus', :length => '0:37' },
  { :track_no => 7, :title => 'Snoop Bounce', :writers => 'Broadus', :length => '4:03' },
  { :track_no => 8, :title => 'Gold Rush', :writers => 'Broadus, Brown, Jamarr Stamps, David Williams, Reggie Vanterpool, Ralph Wheeler', :length => '4:52' },
  { :track_no => 9, :title => '(Tear \'Em Off) Me and My Doggz', :writers => 'Broadus, Brown', :length => '4:22' },
  { :track_no => 10, :title => 'Vapors', :writers => 'Broadus', :length => '4:30' },
  { :track_no => 11, :title => 'Snoop\'s Upside Ya Head', :writers => 'Broadus', :length => '4:30' },
  { :track_no => 12, :title => 'Blueberry', :writers => 'Arnaud, Brown, Stamps, D. Williams, Sam Anderson', :length => '4:15' },
  { :track_no => 13, :title => 'Traffic Jam', :writers => 'Ricky Harris', :length => '0:34' },
  { :track_no => 14, :title => 'Doggyland', :writers => 'Broadus', :length => '4:39' },
  { :track_no => 15, :title => 'Downtown Assassins', :writers => 'Arnaud, Tracey Davis', :length => '4:22' },
  { :track_no => 16, :title => 'Outro', :writers => '', :length => '0:42' }
])

# 3. Da Game Is to Be Sold, Not to Be Told
album = Album.create :title => 'Da Game Is to Be Sold, Not to Be Told',
             :label => 'No Limit/Priority',
             :release_date => Date.new(1998, 8, 4),
             :sales => 2085000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/c/c5/Gameistobesold.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:cassette], formats[:digital]],
             :certifications => [certs[:riaa_2x_plat], certs[:bpi_silver], certs[:mc_plat]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 14),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 4),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 44),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 24),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 11),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 50),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 28)
             ]

# 4. No Limit Top Dogg
album = Album.create :title => 'No Limit Top Dogg',
             :label => 'No Limit/Priority',
             :release_date => Date.new(1999, 5, 11),
             :sales => 1518000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/d/d1/Snoop_front.JPG",
             :album_formats => [formats[:cd], formats[:lp], formats[:cassette], formats[:digital]],
             :certifications => [certs[:riaa_plat], certs[:bpi_gold], certs[:mc_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 2),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 48),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 10),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 53),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 46),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 25),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 48)
             ]

# 5. The Last Meal
album = Album.create :title => 'The Last Meal',
             :label => 'Doggystyle/No Limit/Priority',
             :release_date => Date.new(2000, 12, 19),
             :sales => 2068000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/d/dc/The_Last_Meal_-_Front.jpeg",
             :album_formats => [formats[:cd], formats[:lp], formats[:cassette], formats[:digital]],
             :certifications => [certs[:riaa_plat], certs[:bpi_gold], certs[:mc_plat], certs[:snep_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 4),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 38),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 47),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 15),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 13),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 55),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 19),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 81),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 62)
             ]

# 6. Paid tha Cost to Be da Boss
album = Album.create :title => 'Paid tha Cost to Be da Boss',
             :label => 'Doggystyle/Priority/Capitol',
             :release_date => Date.new(2002, 11, 26),
             :sales => 1300000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/a/a3/Paid_Tha_Cost_to_Be_da_Bo%24%24.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:cassette], formats[:digital]],
             :certifications => [certs[:riaa_plat], certs[:bpi_gold], certs[:mc_gold], certs[:snep_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 12),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 3),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 55),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 48),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 34),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 17),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 46),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 27),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 48),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 64)
             ]

# 7. R&G (Rhythm & Gangsta): The Masterpiece
album = Album.create :title => 'R&G (Rhythm & Gangsta): The Masterpiece',
             :label => 'Doggystyle/Star Trak/Geffen',
             :release_date => Date.new(2004, 11, 16),
             :sales => 1724000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/d/d3/R%26G_%28Rhythm_%26_Gangsta%29-_The_Masterpiece.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:cassette], formats[:digital]],
             :certifications => [certs[:riaa_plat], certs[:aria_gold], certs[:bpi_plat], certs[:bvmi_gold], certs[:ifpi_gold], certs[:mc_plat], certs[:rianz_plat], certs[:snep_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 6),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 4),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 38),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 11),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 8),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 14),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 14),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 11),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 13),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 12)
             ]

# 8. Tha Blue Carpet Treatment
album = Album.create :title => 'Tha Blue Carpet Treatment',
             :label => 'Doggystyle/Geffen',
             :release_date => Date.new(2006, 11, 21),
             :sales => 903000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/6/6b/BlueCarpetTreatment.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [certs[:riaa_gold], certs[:bpi_silver], certs[:snep_gold], certs[:nfpf_gold], certs[:mc_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 5),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 2),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 56),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 46),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 10),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 8),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 41),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 20),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 12),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 47)
             ]

# 9. Ego Trippin'
album = Album.create :title => 'Ego Trippin\'',
             :label => 'Doggystyle/Geffen',
             :release_date => Date.new(2008, 3, 11),
             :sales => 401000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/4/4e/Ego_Trippin%27_%28Snoop_Dogg_album%29.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [certs[:nfpf_gold]],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 3),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 2),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 29),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 27),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 3),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 19),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 29),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 24),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 9),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 23)
             ]

# 10. Malice n Wonderland
album = Album.create :title => 'Malice n Wonderland',
             :label => 'Doggystyle/Priority/Capitol',
             :release_date => Date.new(2009, 12, 8),
             :sales => 400000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/e/e3/Malicenwonderland.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 23),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 5),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 70),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 62),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 74),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 155)
             ]

# 11. Doggumentary
album = Album.create :title => 'Doggumentary',
             :label => 'Doggystyle/Priority/Capitol',
             :release_date => Date.new(2011, 3, 29),
             :sales => 123000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/0/0e/Doggumentary.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 8),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 4),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 12),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 30),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 28),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 36),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 44),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 35),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 16),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 44)
             ]

# 12. Reincarnated
album = Album.create :title => 'Reincarnated',
             :label => 'RCA',
             :release_date => Date.new(2013, 4, 23),
             :sales => 104000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/0/0e/Reincarnated_%28album%29.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 16),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 23),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 45),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 14),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 56),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 20),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 31),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 13),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 34)
             ]

# 13. Bush
album = Album.create :title => 'Bush',
             :label => 'Doggystyle/i am OTHER/Columbia',
             :release_date => Date.new(2015, 5, 12),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/e/e5/Snoop_Dogg_-_Bush.png",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 14),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 1),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 32),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 42),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 13),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 23),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 32),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 39),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 15),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 25)
             ]

# 14. Coolaid
album = Album.create :title => 'Coolaid',
             :label => 'Doggystyle/eOne Music',
             :release_date => Date.new(2016, 7, 1),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/f/f2/Coolaid_album.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 40),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 5),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 51),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 122),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 37),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 146),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 67),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 19),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 122)
             ]

# 15. Neva Left
album = Album.create :title => 'Neva Left',
             :label => 'Doggystyle/Empire',
             :release_date => Date.new(2017, 5, 19),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/b/b2/Neva_Left.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 54),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 26),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 94),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 78),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 39),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 96),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 19)
             ]

# 16. Bible of Love
album = Album.create :title => 'Bible of Love',
             :label => 'All the Time/RCA Inspiration',
             :release_date => Date.new(2018, 3, 16),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/2/2e/Bible_of_Love.png",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 148)
             ]

# 17. I Wanna Thank Me
album = Album.create :title => 'I Wanna Thank Me',
             :label => 'Doggystyle/Empire',
             :release_date => Date.new(2019, 8, 16),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/a/a2/I_Wanna_Thank_Me.png",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 76),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 41),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 63),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 83),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 129),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 23)
             ]

# 18. From tha Streets 2 tha Suites
album = Album.create :title => 'From tha Streets 2 tha Suites',
             :label => 'Doggystyle',
             :release_date => Date.new(2021, 4, 20),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/0/0c/From_tha_Streets_2_tha_Suites.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => []

# 19. BODR
album = Album.create :title => 'BODR',
             :label => 'Death Row',
             :release_date => Date.new(2022, 2, 11),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/b/b1/Snoop_Dogg_-_BODR.png",
             :album_formats => [formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 104),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 83),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 97),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 28)
             ]

# 20. Missionary
album = Album.create :title => 'Missionary',
             :label => 'Death Row/Aftermath/Interscope',
             :release_date => Date.new(2024, 12, 13),
             :sales => 38000,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/4/4e/Snoop_Dogg_-_Missionary.png",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => [
               PeakChartPosition.create(:album_chart => charts[:us], :position => 20),
               PeakChartPosition.create(:album_chart => charts[:usrnb], :position => 7),
               PeakChartPosition.create(:album_chart => charts[:aus], :position => 27),
               PeakChartPosition.create(:album_chart => charts[:bel], :position => 35),
               PeakChartPosition.create(:album_chart => charts[:can], :position => 34),
               PeakChartPosition.create(:album_chart => charts[:fra], :position => 26),
               PeakChartPosition.create(:album_chart => charts[:ger], :position => 7),
               PeakChartPosition.create(:album_chart => charts[:nz], :position => 19),
               PeakChartPosition.create(:album_chart => charts[:swi], :position => 4),
               PeakChartPosition.create(:album_chart => charts[:uk], :position => 24)
             ]

# 21. Iz It a Crime?
album = Album.create :title => 'Iz It a Crime?',
             :label => 'Death Row',
             :release_date => Date.new(2025, 5, 15),
             :sales => nil,
             :cover_artwork_url => "https://upload.wikimedia.org/wikipedia/en/thumb/a/a0/Snoop_Dogg_-_Iz_It_a_Crime.jpg",
             :album_formats => [formats[:cd], formats[:lp], formats[:digital]],
             :certifications => [],
             :peak_chart_positions => []
