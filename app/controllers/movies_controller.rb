class MoviesController < ApplicationController
  
  # should stick a before in here
  # before_action :set_info, only: [:edit, :show]

  def index
    @movies = Movie.all
  end

  def create
    # form_data = params.require(:movie).permit(:title, :year)
    Movie.create movie_params
    redirect_to movies_path
  end

  def new
    @movie = Movie.new
    @actors = @movie.actors
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def show
    @movie = Movie.find params[:id]
    @actors = @movie.actors
  end

  def update
    # form_data = params.require(:movie).permit(:title, :year)
    movie = Movie.find params[:id]
    movie.update_attributes movie_params
    redirect_to movie_path(movie)
  end

  def destroy
    movie = Movie.find params[:id]
    movie.destroy
    redirect_to movies_path
  end

  # Elie added this and it is awesome
  private
  def movie_params
    params.require(:movie).permit(:title, :year)
  end
end
