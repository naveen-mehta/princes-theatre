# Prince's theatre - Movie price comparison app

This app allows users to search movies available on Cinemaworld and Filmworld, and then see which of the two movie providers is streaming it at a cheaper price.  

---
### Table of Contents
  - [Demo](#demo)
  - [Planning](#planning)
  - [Technologies used](#technologies-used)
  - [Testing instructions](#testing-instructions)
  - [Helper methods](#helper-methods)
  - [Templates](#templates)
  - [Assumptions](#assumptions)
  - [Improvements and Trade-offs](#improvements-and-trade-offs)
  - [Instructions to run this app](#instructions-to-run-this-app)

---
## Demo
![Demonstration of Prince's Theatre app](demo.gif)

---
## Planning
As a part of this coding challenge, the API provided for retrieving movie information has been intentionally designed to be unreliable. The API response was tested using Postman. It was decided that wrapping the API request code block in a loop that runs twice should handle the instability issue for this coding challenge. For cases where this approach does not work, the user will be directed to an error page.        

---
## Technologies used
- Ruby
- Javascript
- HTML
- CSS
- RSpec
- HTTParty

---
## Testing instructions
- The RSpec testing framework was utilized for writing test scripts for this coding challenge  
- File path 'spec/movies_helper_spec.rb'
- Tests have been written to test the following Ruby helper methods: 
  1. fetch_movies()
  2. fetch_movie_information()
  3. fetch_price()
- Instructions to run the tests: In your project directory, run the following command 
  rspec spec/movies_helper_spec.rb 

---
## Helper methods
-  File path 'helpers/movies_helper.rb'
-  fetch_movies(movie_provider): 
   1. This method is used to retrieve movie titles and poster information  
   2. Accepts 1 argument for movie provider (filmworld / cinemaworld)
   3. Utilizes the HTTParty method
-  fetch_movie_details(movie_id): 
   1. This method is used to retrieve detailed movie information (Year/Released/Director/Plot/Actors etc.)   
   2. Accepts 1 argument for movie ID 
   3. Utilizes the HTTParty method
   4. Checks if the movie ID starts with "cw" or "fw" and redirects the request to the appropriate movie provider
-  fetch_price(movie_provider, movie_id): 
   1. This method is used to retrieve movie price  
   2. Accepts 2 arguments for movie provider and movie ID 
   3. Utilizes the HTTParty method
   4. Uses the movie provider information to redirect the request appropriately   

## Templates
-  The following 3 templates are used:
   1. layout.erb: This handles the common header and background for the movies template and the error template so as to not repeat HTML code 
   2. movies.erb: This handles the movie information for the landing page
   3. error.erb: This page handles cases where the API request does not return a 200 response

## Assumptions
-  Cinemaworld is used to display movie information on the homepage with the assumption that the information is the same from both providers 
-  The helper methods assume that the movie IDs are the same except the pre-fixes ("cw" and "fw")
-  Since the API only responds with a limited number of movies, there was no need to retrieve the information in batches
-  It was noticed that if the API fails to provide a 200 response, the subsequent request is always successful. Due to this behaviour, a simple loop that runs a few times handles the instability issue. 
-  The API KEY is currently stored in the helper file to make it easier to run for the project reviewer, it should ideally be stored in an environment variable before deploying to production  

## Improvements and Trade-offs
- A single page design makes it easier to view movie information along with price information from both providers in a single view without deviating from the main page 
- The downside of this design is that it requires a minimum of 3 successful API requests to display this information (One request for retrieving Title & poster information and two more requests for retrieving price information from both providers)     
- This design is not efficient from an initial page load standpoint and can result in a request timeout when using providers like Heroku for deployment (Heroku has a 30 second timeout limit after which the connection is closed)
- An improvement in the current design can potentially include the use of AJAX to display price information at a later time in order to avoid one extra API request on page load
- Alternatively, a 2 page design will be better for page load times
- Another approach could be to load information asynchronously using JS 

## Instructions to run this app
- Clone this repo:
git clone https://github.com/naveen-mehta/princes-theatre.git

- Change directory to local repo like the example below:
cd princes-theatre

- Delete the Gemfile.lock 
  
- Install bundler
gem install bundler 

- Run bundle to install dependencies 
bundle install

- Run the app in browser
  1. ruby main.rb
  2. Open in browser using the correct port -> http://localhost:4567

