class Film < ApplicationRecord
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :people
  has_and_belongs_to_many :species
  has_and_belongs_to_many :planets
end
