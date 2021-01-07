require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/ClassicMovies' do
    erb :movies
end