def fetch_movies(movie_provider)
    url = "https://challenge.lexicondigital.com.au/api/#{movie_provider}/movies/"
    results = HTTParty.get(url, :headers => {
        "X-Api-Key" => "Yr2636E6BTD3UCdleMkf7UEdqKnd9n361TQL9An7"
    })
end