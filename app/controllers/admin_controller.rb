class AdminController < ApplicationController
	include AdminHelper
	before_action :admin_auth


	def index
		@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.create(movie_params)

		if @movie.save
			redirect_to admin_path(@movie)
		else
			@movie = movie_params # this should be able to render "new.erb" with the previously entered values
			render :new
		end
	end

	# def show
	# 	# not really going to be using this since the edit page should be enough
	# 	@movie = Movie.find(params[:id])
	# end
	
	def edit
		@movie = Movie.find(params[:id])
	end

	def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
    	redirect_to admin_index_path
    else
    	render :edit
    end
	end

	def destroy
		Movie.destroy(params[:id])
		redirect_to admin_index_path
	end

	private

	def movie_params
		params.require(:movie).permit(:title,:synopsis,:image)
	end
end
