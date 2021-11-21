class CreateFilmsVehicleJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :films_vehicles, id: false do |t|
      t.belongs_to :film, index: true
      t.belongs_to :vehicle, index: true
    end
  end
end
