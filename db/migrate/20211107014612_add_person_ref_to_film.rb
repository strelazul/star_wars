class AddPersonRefToFilm < ActiveRecord::Migration[6.1]
  def change
    add_reference :films, :people, foreign_key: true
    add_reference :films, :species, foreign_key: true
    add_reference :films, :planets, foreign_key: true
  end
end
