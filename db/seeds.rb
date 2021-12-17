# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "net/http"

Person.destroy_all
Film.destroy_all
Starship.destroy_all
Vehicle.destroy_all
Species.destroy_all
Planet.destroy_all

# base_url = "https://www.swapi.tech/api/"
base_url = "https://swapi.py4e.com/api/"
# base_url = "https://www.swapi.dev/api/"

def url?(str)
  str =~ /\A#{URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/
end

def get_id(str)
  if url?(str)
    split_str = str.split("/")
    return split_str[split_str.length - 1]
  end
  str
end

def parse_fields(json)
  json["results"].each do |item|
    item.each do |key, value|
      if value.instance_of?(Array)
        value.each_index do |i|
          value[i] = get_id(value[i])
        end
      end
      item[key] = get_id(value)
    end
  end
  json["results"]
end

def parse_fields_film(json)
  properties = []
  json["result"].each do |film|
    properties = film["properties"]
    properties.each do |key, value|
      if value.instance_of?(Array)
        value.each_index do |i|
          value[i] = get_id(value[i]) if url?(value[i])
        end
      end
      properties[key] = get_id(value) if url?(value)
    end
  end
  properties
end

def get_data(url_str)
  page_url = url_str
  data = []
  until page_url.nil?
    response = Net::HTTP.get(URI(page_url))
    json = JSON.parse(response)
    data.concat(parse_fields(json))
    # call json.next
    page_url = json["next"]
  end
  data
end

def get_films_data(url_str)
  page_url = url_str
  data = []
  until page_url.nil?
    uri = URI(page_url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    data.concat(parse_fields_film(json))
    # call json.next
    page_url = json["next"]
  end
  data
end

# People
people_data = get_data("#{base_url}people/")
people_data.each do |person_data|
  person = Person.new(name:       person_data["name"],
                      birth_year: person_data["birth_year"],
                      eye_color:  person_data["eye_color"],
                      gender:     person_data["gender"],
                      hair_color: person_data["hair_color"],
                      height:     person_data["height"].to_i,
                      mass:       person_data["mass"].to_i,
                      skin_color: person_data["skin_color"])
  person.id = person_data["url"]
  person.save
end

# Film
films_data = get_data("#{base_url}films/")
films_data.each do |film_data|
  film = Film.new(title:         film_data["title"],
                  episode_id:    film_data["episode_id"].to_i,
                  opening_crawl: film_data["opening_crawl"],
                  director:      film_data["director"],
                  producer:      film_data["producer"],
                  release_date:  film_data["release_date"])
  film.id = film_data["url"]
  film.save
end

# Starships
starships_data = get_data("#{base_url}starships/")
starships_data.each do |starship_data|
  starship = Starship.new(name:                   starship_data["name"],
                          model:                  starship_data["model"],
                          starship_class:         starship_data["starship_class"],
                          manufacturer:           starship_data["manufacturer"],
                          cost_in_credits:        starship_data["cost_in_credits"].to_i,
                          length:                 starship_data["length"].to_f,
                          crew:                   starship_data["crew"],
                          passengers:             starship_data["passengers"],
                          max_atmosphering_speed: starship_data["max_atmosphering_speed"],
                          hyperdrive_rating:      starship_data["hyperdrive_rating"],
                          MGLT:                   starship_data["MGLT"],
                          cargo_capacity:         starship_data["cargo_capacity"],
                          consumables:            starship_data["consumables"])
  starship.id = starship_data["url"]
  starship.save
end

# Vehicles
vehicles_data = get_data("#{base_url}vehicles/")
vehicles_data.each do |vehicle_data|
  vehicle = Vehicle.new(name:                   vehicle_data["name"],
                        model:                  vehicle_data["model"],
                        vehicle_class:          vehicle_data["vehicle_class"],
                        manufacturer:           vehicle_data["manufacturer"],
                        cost_in_credits:        vehicle_data["cost_in_credits"],
                        length:                 vehicle_data["length"],
                        crew:                   vehicle_data["crew"],
                        passengers:             vehicle_data["passengers"],
                        max_atmosphering_speed: vehicle_data["max_atmosphering_speed"],
                        cargo_capacity:         vehicle_data["cargo_capacity"],
                        consumables:            vehicle_data["consumables"])
  vehicle.id = vehicle_data["url"]
  vehicle.save
end

# Planets
planets_data = get_data("#{base_url}planets/")
planets_data.each do |planet_data|
  planet = Planet.new(name:            planet_data["name"],
                      diameter:        planet_data["diameter"],
                      rotation_period: planet_data["rotation_period"],
                      orbital_period:  planet_data["orbital_period"],
                      gravity:         planet_data["gravity"],
                      population:      planet_data["population"],
                      climate:         planet_data["climate"],
                      terrain:         planet_data["terrain"],
                      surface_water:   planet_data["surface_water"])
  planet.id = planet_data["url"]
  planet.save
end

# Species
species_data = get_data("#{base_url}species/")
species_data.each do |specie_data| # I know the singular for species is species...
  next if specie_data["homeworld"].nil?

  planet = Planet.find(specie_data["homeworld"].to_i)
  puts "#{planet.id} - #{planet.name}"
  species = planet.species.build(name:             specie_data["name"],
                                 classification:   specie_data["classification"],
                                 designation:      specie_data["designation"],
                                 average_height:   specie_data["average_height"],
                                 average_lifespan: specie_data["average_lifespan"],
                                 eye_colors:       specie_data["eye_colors"],
                                 hair_colors:      specie_data["hair_colors"],
                                 skin_colors:      specie_data["skin_colors"],
                                 language:         specie_data["language"])
  species.id = specie_data["url"].to_i
  species.save
end

# Loop through each table data and stabilish all relations.
films_data.each do |data|
  film = Film.find(data["url"])
  species = Species.where(id: data["species"])
  film.species << species
  vehicles = Vehicle.where(id: data["vehicles"])
  film.vehicles << vehicles
  characters = Person.where(id: data["characters"])
  film.people << characters
  planets = Planet.where(id: data["planets"])
  film.planets << planets
  starships = Starship.where(id: data["starships"])
  film.starships << starships
end

people_data.each do |data|
  person = Person.find(data["url"])
  vehicles = Vehicle.where(id: data["vehicles"])
  person.vehicles << vehicles
  starships = Starship.where(id: data["starships"])
  person.starships << starships
  planet = Planet.where(id: data["homeworld"])
  person.planet << planet
end
