require "net/http"
require "json"
require "uri"

class PeopleController < ApplicationController
  def index
    @people = Person.all
  end
end
