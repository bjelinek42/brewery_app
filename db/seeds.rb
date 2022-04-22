# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'geocoder'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'breweries_us.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  if Geocoder.search(row['address']).first
    b = Brewery.create({
    name: row['brewery_name'],
    address: row['address'],
    latitude: Geocoder.search(row['address']).first.coordinates[0],
    longitude: Geocoder.search(row['address']).first.coordinates[1]
    })
    puts "#{b.name}, #{b.address} saved"
  end
  
end

puts "There are now #{Brewery.count} rows in the breweries table"