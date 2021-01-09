require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative 'helpers/helper.rb'
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