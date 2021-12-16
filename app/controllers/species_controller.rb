class SpeciesController < ApplicationController
  before_action :set_species_active

  def index
    @species = Species.includes(:people).all
  end

  private

  def set_species_active
    @films_active = ""
    @people_active = ""
    @planets_active = ""
    @species_active = "active"
    @starships_active = ""
    @vehicles_active = ""
  end
end
