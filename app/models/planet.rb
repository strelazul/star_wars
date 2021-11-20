class Planet < ApplicationRecord
  has_and_belongs_to_many :films
  has_many :people
  has_many :species
end
