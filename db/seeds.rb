# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

require "json"
require "open-uri"

puts "Cleaning database..."
Movie.destroy_all

# puts "Creating restaurants..."
url = "https://tmdb.lewagon.com/movie/popular"
img_url = "https://image.tmdb.org/t/p/w500/"
data_serialized = URI.open(url).read
# puts "#{data_serialized.class}"
results = JSON.parse(data_serialized)
movies = results["results"]

movies.each do |movie|
  Movie.create(title: movie['title'],
               overview: movie['overview'],
               poster_url: "#{img_url}#{movie['poster_path']}",
               rating: movie['vote_average'])
end
puts "Finished!"

# puts "#{results["results"][0]["original_title"]}"
# puts "#{results["results"][0]["overview"]}"
# puts "#{results["results"][0]["vote_average"]}"
# puts"#{img_url}#{results["results"][0]["poster_path"]}"
