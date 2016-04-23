class AdminController < ApplicationController
	def index
		@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
		if @movie.save

		else
			@movie = movie_params # this should be able to render "new.erb" with the previously entered values
			render => :new
		end
	end

	def show

	end
	
	def edit

	end


	def edit

	end

	def destroy

	end

	private

	def movie_params
		params.require(:movie).permit(:title,:synopsis,:picture)
	end
end
