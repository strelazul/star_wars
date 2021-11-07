class AddPersonRefToFilm < ActiveRecord::Migration[6.1]
  def change
    add_reference :films, :people, null: false, foreign_key: true
    add_reference :films, :species, null: false, foreign_key: true
    add_reference :films, :planets, null: false, foreign_key: true
  end
end
