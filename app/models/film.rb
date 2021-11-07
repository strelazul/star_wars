class Film < ApplicationRecord
  has_and_belongs_to_many :starships
  has_and_belongs_to_many :vehicles
end
