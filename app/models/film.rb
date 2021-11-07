class Film < ApplicationRecord
  has_and_belongs_to_many :starships, foreign_key: "starships"
end
