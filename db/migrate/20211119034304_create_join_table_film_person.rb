class CreateJoinTableFilmPerson < ActiveRecord::Migration[6.1]
  def change
    create_join_table :films, :people do |t|
      t.index %i[film_id person_id]
      t.index %i[person_id film_id]
    end
  end
end
