class PlanetsController < ApplicationController
  before_action :set_planets_active

  def index
    @planets = Planet.includes(:species).all
  end

  private

  def set_planets_active
    @films_active = ""
    @people_active = ""
    @planets_active = "active"
    @species_active = ""
    @starships_active = ""
    @vehicles_active = ""
  end
end
