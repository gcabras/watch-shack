# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

api_key = 'k_71bzmhl3'

url = URI("https://imdb-api.com/en/API/Top250Movies/#{api_key}")

movies_serialized = URI.open(url).read

movies = JSON.parse(movies_serialized)

puts "Seeding Database from IMDB"

movies['items'].each do |movie|
  movie_title = movie['title']
  movie_rating = movie['imDbRating'].to_i
  movie_id = movie['id']
  plot_url = URI.open("https://imdb-api.com/en/API/Title/#{api_key}/#{movie_id}").read
  movie_overview = JSON.parse(plot_url)['plot']
  movie_genres = JSON.parse(plot_url)['genres']
  poster_url = URI.open("https://imdb-api.com/en/API/Posters/#{api_key}/#{movie_id}").read
  movie_poster = ''
  if JSON.parse(poster_url)['posters'].empty?
    movie_poster = movie['image']
  else
    movie_poster = JSON.parse(poster_url)['posters'].sample['link']
  end
  puts "Adding #{movie_title}"
  movie = Movie.new(
    title: movie_title,
    overview: movie_overview,
    poster_url: movie_poster,
    rating: movie_rating
  )
  movie_genres.split(',').each do |genre|
    movie.genres << genre
  end
  movie.save!
end

puts 'Finished'
