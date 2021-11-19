# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.destroy_all
Film.destroy_all
Starship.destroy_all
Vehicle.destroy_all
Species.destroy_all
Planet.destroy_all

def url?(str)
  str =~ /\A#{URI::DE2167eFAULT_PARSER.make_regexp(['http', 'https'])}\z/
end

def get_id(str)
  split_str = str.split("/")
  split_str[split_str.length - 1]
end

def url_to_id(json)
  json["results"].each do |person|
    person.each do |key, value|
      if value.is_a?(Array)
        value.each_index do |i|
          value[i] = get_id(value[i]) if url?(value[i])
        end
      end
      person[key] = get_id(value) if url?(value)
    end
  end
  json["results"]
end

def get_data(url_str)
  page_url = url_str
  data = []
  until page_url.nil?
    uri = URI(page_url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    data.concat(url_to_id(json))
    # call json.next
    page_url = json["next"]
  end
  data
end

# People
people_data = get_data("https://swapi.dev/api/people")
people_data.each do |person_data|
  person = Person.new(name:       person_data["name"],
                      birth_year: person_data["birth_year"],
                      eye_color:  person_data["eye_color"],
                      gender:     person_data["gender"],
                      hair_color: person_data["hair_color"],
                      height:     person_data["height"],
                      mass:       person_data["mass"],
                      skin_color: person_data["skin_color"])
  person.id = person_data["url"]
  person.save
end

# Film
films_data = get_data("https://swapi.dev/api/films")
films_data.each do |film_data|
  film = Film.new(title:         film_data["title"],
                  episode_id:    film_data["episode_id"],
                  opening_crawl: film_data["opening_crawl"],
                  director:      film_data["director"],
                  producer:      film_data["producer"],
                  release_date:  film_data["release_date"])
  film.id = film_data["url"]
  film.save
end

# Starships
starships_data = get_data("https://swapi.dev/api/starships")
starships_data.each do |starship_data|
  starship = Starship.new(name:                   starship_data["name"],
                          model:                  starship_data["model"],
                          starship_class:         starship_data["starship_class"],
                          manufacturer:           starship_data["manufacturer"],
                          cost_in_credits:        starship_data["cost_in_credits"],
                          length:                 starship_data["length"],
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
vehicles_data = get_data("https://swapi.dev/api/vehicles")
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

# Species
species_data = get_data("https://swapi.dev/api/species")
species_data.each do |spicie_data| # I know the singular for species is species...
  species = Species.new(name:             spicie_data["name"],
                        classification:   spicie_data["classiufication"],
                        designation:      spicie_data["designation"],
                        average_height:   spicie_data["average_height"],
                        average_lifespan: spicie_data["average_lifespan"],
                        eye_colors:       spicie_data["eye_colors"],
                        hair_colors:      spicie_data["hair_colors"],
                        skin_colors:      spicie_data["skin_colors"],
                        language:         spicie_data["language"])
  species.id = spicie_data["url"]
  species.save
end

# Planets
planets_data = get_data("https://swapi.dev/api/planets")
planets_data.each do |planet_data|
  planet = Planet.new(name:            planet_data["name"],
                      diameter:        planet_data["diameter"],
                      rotation_period: planet_cata["rotation_period"],
                      orbital_period:  planet_data["orbital_period"],
                      gravity:         planet_data["gravity"],
                      population:      planet_data["population"],
                      climate:         planet_data["climate"],
                      terrain:         planet_data["terrain"],
                      surface_water:   planet_data["surface_water"])
end
