class WelcomeController < ApplicationController
  def index
  	@reviews = Review.order('created_at DESC').limit(10)
  	@newestMovies = Movie.last(3)
  end
end
