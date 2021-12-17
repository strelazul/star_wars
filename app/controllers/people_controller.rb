class PeopleController < ApplicationController
  before_action :set_people_active

  def index
    @people = Person.includes(:planets).includes(:species).all
  end

  private

  def set_people_active
    @films_active = ""
    @people_active = "active"
    @planets_active = ""
    @species_active = ""
    @starships_active = ""
    @vehicles_active = ""
  end
end
