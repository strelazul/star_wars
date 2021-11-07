class Film < ApplicationRecord
  has_and_belongs_to_many :starships, foreign_key: "starships"
  has_and_belongs_to_many :vehicles, foreign_key: "vehicles"
end
