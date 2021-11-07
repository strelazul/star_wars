class AddFilmRefToVehicle < ActiveRecord::Migration[6.1]
  def change
    add_reference :starships, :films, null: false, foreign_key: true
    add_reference :starships, :people, null: false, foreign_key: true
  end
end
