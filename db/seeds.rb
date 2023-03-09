require "open-uri"
require "json"
require "faker"

puts "Cleaning up database..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts "Database cleaned"

url2 = "https://api.themoviedb.org/3/list/634?api_key=faf4e2443a3935b78fc5c1d747520a64"
puts "Importing movies from page this list"
movies = JSON.parse(URI.open("#{url2}").read)['items']
movies.each do |movie|
  id = movie["id"]
  url3 = "https://api.themoviedb.org/3/movie/#{id}?api_key=faf4e2443a3935b78fc5c1d747520a64"
  details = JSON.parse(URI.open("#{url3}").read)
  puts "Creating #{details['title']}"
  base_poster_url = "https://image.tmdb.org/t/p/original"
  Movie.create(
    title: details["title"],
    overview: details["overview"],
    poster_url: "#{base_poster_url}#{details["backdrop_path"]}",
    rating: details["vote_average"],
    genre:
      if (details["genres"][1]).present?
        "#{details["genres"][0]["name"]}, #{details["genres"][1]["name"]}"
      else
        "#{details["genres"][1]}"
      end,
    original_language: details["original_language"],
    release_date: details["release_date"],
    tagline: details["tagline"],
    vote_count: details["vote_count"]
  )
end
puts "Created #{Movie.count} movies"

10.times do
  lists = List.create(
    name: Faker::TvShows::RuPaul.queen,
    description: Faker::TvShows::RuPaul.quote
  )
  lists.movies << Movie.all.sample(10)
  lists.save
end

5.times do
  bookmark = Bookmark.create(
    comment: Faker::TvShows::TheITCrowd.quote,
    movie_id: Faker::Number.between(from: 1, to: 250),
    list_id: Faker::Number.between(from: 1, to: 10)
  )
  bookmark.save
end
