class CreateFilmsStarshipsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :films, :starships do |t|
      t.index %i[film_id starship_id]
      t.index %i[starship_id film_id]
    end
  end
end
