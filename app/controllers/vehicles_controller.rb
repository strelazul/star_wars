class VehiclesController < ApplicationController
  before_action :set_vehicles_active

  def index
    @vehicles = Vehicles.includes(:people).all
  end

  private

  def set_vehicles_active
    @films_active = ""
    @people_active = ""
    @planets_active = ""
    @species_active = ""
    @starships_active = ""
    @vehicles_active = "active"
  end
end
