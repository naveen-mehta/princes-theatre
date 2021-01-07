require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative 'helpers/helper.rb'

get '/ClassicMovies' do
    movies_from_cinemaworld = fetch_movies("cinemaworld")
    movies_from_filmworld = fetch_movies("filmworld")
    
    if movies_from_cinemaworld.success? 
        erb :movies, locals: {
            movies: movies_from_cinemaworld["Movies"]
        }
    elsif movies_from_filmworld.success?
        erb :movies, locals: {
            movies: movies_from_filmworld["Movies"]
        }
    else 
        erb :error   
    end
end