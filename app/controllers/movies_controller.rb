class MoviesController < ApplicationController

def index
  @movies = Movie.movies_alphabetical
end

end
