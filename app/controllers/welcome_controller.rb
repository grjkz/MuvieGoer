class WelcomeController < ApplicationController
  def index
  	@review = Review.last
  end
end
