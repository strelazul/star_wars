class PeopleController < ApplicationController
  def index
    @films = Film.includes([:vehicles]).all
    @all_species = Species.all
  end
end
