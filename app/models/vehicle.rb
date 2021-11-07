class Vehicle < ApplicationRecord
  has_and_belongs_to_many :films, foreign_key: "films"
  has_and_belongs_to_many :people, foreign_key: "pilots"
end
