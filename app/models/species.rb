class Species < ApplicationRecord
  has_and_belongs_to_many :films
  has_many :people
  has_one :planets
end
