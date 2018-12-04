require 'active_record'
require 'faker'
require 'pry'
require_relative './artist'

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

end

10.times do 
  Artist.create!(name: Faker::Music.band)
end
binding.pry

  