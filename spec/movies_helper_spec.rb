require_relative '../helpers/movies_helper.rb'
require 'httparty'

describe 'Cinema World API Tests' do
    context '#fetch_movies' do
        movies = fetch_movies('cinemaworld')
        describe 'HTTParty response from Cinemaworld API' do 
            it 'should return true' do        
                expect(movies.success?).to eq true 
            end
        end
    end

    context '#fetch_movie_details' do
        movie_details = fetch_movie_details('cw2488496')
        describe 'Search movie by ID' do 
            it 'should return true' do        
                expect(movie_details["ID"] == "cw2488496").to eq true 
            end
        end
    end

    context '#fetch_price' do
        movie_price = fetch_price('cinemaworld', 'cw0076759')
        describe 'Cinemaworld price for Movie ID:- cw0076759' do 
            it 'should return 25.5' do        
                expect(movie_price).to eq 25.5 
            end
        end
    end
end 

describe 'Film World API Tests' do
    context '#fetch_movies' do
        movies = fetch_movies('filmworld')
        describe 'HTTParty response from Filmworld API' do 
            it 'should return true' do        
                expect(movies.success?).to eq true 
            end
        end
    end

    context '#fetch_movie_details' do
        movie_details = fetch_movie_details('fw2488496')
        describe 'Search movie by ID' do 
            it 'should return true' do        
                expect(movie_details["ID"] == "fw2488496").to eq true 
            end
        end
    end

    context '#fetch_price' do
        movie_price = fetch_price('filmworld', 'fw0076759')
        describe 'Filmworld price for Movie ID:- fw0076759' do 
            it 'should return 22.9' do        
                expect(movie_price).to eq 22.9 
            end
        end
    end
end 