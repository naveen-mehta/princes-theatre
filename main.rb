require 'sinatra' 
require 'httparty'
require_relative 'helpers/movies_helper.rb'
require 'json'

get '/ClassicMovies' do
    movies_from_cinemaworld = fetch_movies("cinemaworld")
    erb :movies, locals: {
        movies: movies_from_cinemaworld["Movies"]
    }
end

get '/error' do
    erb :error
end