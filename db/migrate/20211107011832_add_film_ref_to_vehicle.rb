class AddFilmRefToVehicle < ActiveRecord::Migration[6.1]
  def change
    add_reference :vehicles, :films, foreign_key: true
    add_reference :vehicles, :people, foreign_key: true
  end
end
