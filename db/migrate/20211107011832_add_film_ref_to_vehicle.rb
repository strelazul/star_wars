class AddFilmRefToVehicle < ActiveRecord::Migration[6.1]
  def change
    add_reference :vehicles, :films, null: false, foreign_key: true
    add_reference :vehicles, :people, null: false, foreign_key: true
  end
end
