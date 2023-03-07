require "open-uri"
require "json"
require "faker"

puts "Cleaning up database..."
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"]
    )
  end
end

5.times do
  lists = List.create(
    name: Faker::TvShows::RuPaul.queen,
    description: Faker::TvShows::RuPaul.quote
  )
  lists.save
end

5.times do
  bookmark = Bookmark.create(
    comment: Faker::TvShows::TheITCrowd.quote,
    movie_id: Faker::Number.between(from: 1, to: 10),
    list_id: Faker::Number.between(from: 1, to: 5)
  )
  bookmark.save
end

puts "Movies created"
