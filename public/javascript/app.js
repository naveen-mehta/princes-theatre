function searchMovie() {
    // Declare variables
    var searchQuery, filter, movieList, movieOuterContainer, movieInfo, i, txtValue;
    searchQuery = document.querySelector('.movie-search-query');
    filter = searchQuery.value.toUpperCase();
    movieOuterContainer = document.querySelector('.movie-outer-container');
    movieList = movieOuterContainer.querySelectorAll('.movie-inner-container');
  
    // Loop through all list items & hide those that don't match search query
    for (i = 0; i < movieList.length; i++) {
      movieInfo = movieList[i].querySelectorAll('.movie-title-container');
      txtValue = movieInfo[0].textContent || movieInfo[0].innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        movieList[i].style.display = "";
      } else {
        movieList[i].style.display = "none";
      }
    }
  }