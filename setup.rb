require 'active_record'
require 'pry'
require 'faker'

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
# use tracks albums erd
ActiveRecord::Schema.define do
# t => table builder Object
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
    t.string :title, null: false
    t.integer :number, null: false
    t.references :album
    t.timestamps
  end
  
  create_table :tags, force: true do |t|
    t.string :name
  end
  
  create_join_table :artists, :tags, force: true
end

10.times do 
  Artist.create! name: Faker::Simpsons.character
end

artist1 = Artist.first
artist2 = Artist.last

5.times do 
  Album.create! title: Faker::Simpsons.location, year: rand(1990...2010), artist: Artist.all.sample
end

5.times do 
  Album.create! title: Faker::Simpsons.location, year: rand(1990...2010), artist: Artist.all.sample
end

Album.all.each do |album|
  rand(3...7).times do |n|
    Track.create! title: Faker::StarTrek.villain, number: n, album: album
  end

end

10.times do 
  Tag.create! name: Faker::Superhero.prefix
end

all_artist = Artist.all
all_tags = Tag.all

20.times do 
  artist = all_artist.sample
  tag = all_tags.sample
  artist.tags << tag
end


binding.pry

