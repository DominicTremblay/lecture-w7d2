require 'active_record'
require 'faker'
require 'pry'
require_relative './artist'
require_relative './album'
require_relative './track'

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'labber',
  password: 'labber',
  database: 'w7d2_lecture'
)

ActiveRecord::Schema.define do

  create_table :artists, force: true do |t|
    t.string :name, null: false
    t.timestamps
  end

  create_table :albums, force: true do |t|
    t.string :title, null: false
    t.integer :year, null: false
    t.references :artist
    t.timestamps
  end

  create_table :tracks, force: true do |t|
    t.string :title
    t.integer :number
    t.references :album
    t.timestamps
  end

end

puts "Creating artists..."
puts "==================="
10.times do 
  Artist.create!(name: Faker::Music.band)
end

puts "Creating albums by assigning artist_id..."
puts "========================================="
10.times do
  Album.create!(title: Faker::Music.album, year: rand(1990..2018), artist: Artist.all.sample)
end

puts "Creating albums with the relationship..."
puts "========================================"
# Another way or creating albums through the relationship
Artist.all.each do |artist|
  artist.albums.create!(title: Faker::Music.album, year: rand(1990..2018))
end

puts "Creating tracks..."
puts "=================="

Album.all.each do |album|
  rand(3..6).times do
    Track.create!(title: Faker::FamousLastWords.last_words, number: rand(1..5), album: album)
  end
end

binding.pry

  