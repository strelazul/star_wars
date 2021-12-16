class StarshipsController < ApplicationController
  before_action :set_starships_active

  def index
    @starships = Starships.includes(:people).all
  end

  private

  def set_starships_active
    @films_active = ""
    @people_active = ""
    @planets_active = ""
    @species_active = ""
    @starships_active = "active"
    @vehicles_active = ""
  end
end
