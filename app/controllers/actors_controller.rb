class ActorsController < ApplicationController

  # should stick a before in here

  def index
    @actors = Actor.all
  end

  def create
    Actor.create actor_params
    redirect_to actors_path
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find params[:id]
  end

  def show
    @actor = Actor.find params[:id]
    @movies = @actor.movies
  end

  def update
    actor = Actor.find params[:id]
    actor.update_attributes actor_params
    redirect_to actor_path(actor)
  end

  def destroy
    actor = Actor.find params[:id]
    actor.destroy
    redirect_to actor_path
  end

private 
  def actor_params
    params.require(:actor).permit(:name)
  end

end