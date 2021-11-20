class Person < ApplicationRecord
  has_and_belongs_to_many :films
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
  belongs_to :planets
end
