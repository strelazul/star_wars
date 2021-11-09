class Person < ApplicationRecord
  has_and_belongs_to_many :films
  has_many :species
  has_one :planets
end
