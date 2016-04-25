class WelcomeController < ApplicationController
  def index
  	@reviews = Review.order('created_at DESC').limit(10)
  	@review = Review.last
  	@movie = @review.movie
  end
end
