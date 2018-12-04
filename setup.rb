require 'active_record'
require 'faker'
require 'pry'
require_relative './artist'
require_relative './album'

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
  end

end

10.times do 
  Artist.create!(name: Faker::Music.band)
end

Artist.all.each do |artist|
  artist.albums.create!(title: Faker::Music.album, year: rand(1990..2018))
end

10.times do
  Album.create!(title: Faker::Music.album, year: rand(1990..2018), artist: Artist.all.sample)
end

binding.pry

  