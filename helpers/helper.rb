def HTTParty(url)
    1.times do 
        results = HTTParty.get(url, :headers => {
            "X-Api-Key" => "Yr2636E6BTD3UCdleMkf7UEdqKnd9n361TQL9An7"
        })
        return results if results.success? 
    end
end

def fetch_movies(movie_provider)
    url = "https://challenge.lexicondigital.com.au/api/#{movie_provider}/movies/"
    return HTTParty(url)
end

def fetch_movie_details(movie_id) 
    if movie_id.start_with?("cw")
        url_cinemaworld = "https://challenge.lexicondigital.com.au/api/cinemaworld/movie/#{movie_id}"
        movie_details_from_cinemaworld = HTTParty(url_cinemaworld)        
        return movie_details_from_cinemaworld
    else 
        url_filmworld = "https://challenge.lexicondigital.com.au/api/filmworld/movie/#{movie_id}"
        movie_details_from_filmworld = HTTParty(url_filmworld)
        return movie_details_from_filmworld
    end    
end

def fetch_price(movie_provider, movie_id)
    if movie_provider.eql? "cinemaworld"
        url = "https://challenge.lexicondigital.com.au/api/cinemaworld/movie/#{movie_id.sub(/[f]/,'c')}"
        movie = HTTParty(url)
        return movie["Price"]
    else
        url = "https://challenge.lexicondigital.com.au/api/filmworld/movie/#{movie_id.sub(/[c]/,'f')}"
        movie = HTTParty(url)
        return movie["Price"]
    end
end


