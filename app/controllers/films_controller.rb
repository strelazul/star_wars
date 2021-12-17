class FilmsController < ApplicationController
  before_action :set_films_active

  def index
    @films = Film.all
  end

  def show
    @film = Film.includes(:people).find(params[:id])
  end

  private

  def set_films_active
    @films_active = "active"
    @people_active = ""
    @planets_active = ""
    @species_active = ""
    @starships_active = ""
    @vehicles_active = ""
  end

  def films_params
    params.require(:film).permit(:id, :title, :episode_id)
  end
end
