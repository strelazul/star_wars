class CreateFilmsVehicleJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :films, :vehicles do |t|
      t.index %i[film_id vehicle_id]
      t.index %i[vehicle_id film_id]
    end
  end
end
