class AdminController < ApplicationController
	def index
		@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)
		
		p movie_params
		p @movie

		if @movie.save
			redirect_to admin_path(@movie)
		else
			@movie = movie_params # this should be able to render "new.erb" with the previously entered values
			render :new
		end
	end

	def show
		@movie = Movie.find(params[:id])
	end
	
	def edit
		@movie = Movie.find(params[:id])
	end

	def update

	end

	def destroy

	end

	private

	def movie_params
		params.require(:movie).permit(:title,:synopsis,:image)
	end
end
