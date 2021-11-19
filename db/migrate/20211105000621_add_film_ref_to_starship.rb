class AddFilmRefToStarship < ActiveRecord::Migration[6.1]
  def change
    add_reference :starships, :films, foreign_key: true
    add_reference :starships, :people, foreign_key: true
  end
end
