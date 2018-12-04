require 'active_record'
require 'faker'
require 'pry'
require_relative './artist'
require_relative './album'
require_relative './track'
require_relative './tag'

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'labber',
  password: 'labber',
  database: 'w7d2_lecture'
)

ActiveRecord::Schema.define do

  puts "Creating artists table ------------"
  create_table :artists, force: true do |t|
    t.string :name, null: false
    t.timestamps
  end

  puts "Creating albums table ------------"
  create_table :albums, force: true do |t|
    t.string :title, null: false
    t.integer :year, null: false
    t.references :artist
    t.timestamps
  end

  puts "Creating tracks table ------------"
  create_table :tracks, force: true do |t|
    t.string :title, null: false
    t.integer :number, null: false
    t.references :album
    t.timestamps
  end

  puts "Creating tags table ------------"

  create_table :tags, force: true do |t|
    t.string :name, null: false
    t.timestamps
  end

  puts "Creating artist_tags table ------------"
  create_join_table :artist, :tags, force: true

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

puts "Creating tags..."
puts "=================="

30.times do 
  Tag.create!(name: Faker::Space.galaxy)
end

20.times do
  artist = Artist.all.sample
  tag = Tag.all.sample
  artist.tags << tag
end

binding.pry

  