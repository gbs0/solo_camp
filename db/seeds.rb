require "open-uri"
require "yaml"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
file = "https://gist.githubusercontent.com/gbs0/ae18f4b60c816a917ac5887a9fb3e23c/raw/9e742eb09cead62b2b1c4704dabbe0a7c83891fa/seed_solocamp.yml"
sample = YAML.load(open(file).read)

# puts 'Creating owners...'
# directors = {}  # slug => Director
# sample["ownerships"].each do |director|
#   ownerships[ownership["slug"]] = Ownership.create! director.slice("name", "last_name")
# end

# puts 'Creating movies...'
# sample["movies"].each do |movie|
#   Movie.create! movie.slice("title", "year", "syllabus").merge(ownership: ownerships[movie["ownership_slug"]])
# end

puts 'Creating Insumos...'
sample["insumos"].each do |insumo|
  Insumo.create! insumo
end