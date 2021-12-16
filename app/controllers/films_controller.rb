class FilmsController < ApplicationController
  before_action :set_films_active

  def index
    @films = Film.includes(:people).all
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
end
