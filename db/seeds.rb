require "open-uri"
require "yaml"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sample = YAML.load(open(file).read)

puts 'Creating owners...'
directors = {}  # slug => Director
sample["ownerships"].each do |director|
  ownerships[ownership["slug"]] = Ownership.create! director.slice("name", "last_name")
end

puts 'Creating movies...'
sample["movies"].each do |movie|
  Movie.create! movie.slice("title", "year", "syllabus").merge(director: ownerships[movie["director_slug"]])
end

puts 'Creating tv shows...'
sample["series"].each do |tv_show|
  TvShow.create! tv_show
end