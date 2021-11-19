class CreateJoinTableFilmSpecies < ActiveRecord::Migration[6.1]
  def change
    create_join_table :films, :species do |t|
      t.index %i[film_id species_id]
      t.index %i[species_id film_id]
    end
  end
end
