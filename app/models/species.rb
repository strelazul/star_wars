class Species < ApplicationRecord
  has_and_belongs_to_many :films
  has_and_belongs_to_many :people
  belongs_to :planets
end
