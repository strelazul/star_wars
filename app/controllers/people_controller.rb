class PeopleController < ApplicationController
  def index
    @films = Film.includes([:starships, :vehicles]).all
  end
end
