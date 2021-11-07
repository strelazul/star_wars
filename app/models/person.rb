class Person < ApplicationRecord
  has_and_belongs_to_many :films
  belongs_to :species
end
