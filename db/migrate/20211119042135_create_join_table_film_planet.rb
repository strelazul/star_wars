class CreateJoinTableFilmPlanet < ActiveRecord::Migration[6.1]
  def change
    create_join_table :films, :planets do |t|
      t.index %i[film_id planet_id]
      t.index %i[planet_id film_id]
    end
  end
end
