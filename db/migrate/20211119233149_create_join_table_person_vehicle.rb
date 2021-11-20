class CreateJoinTablePersonVehicle < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :vehicles do |t|
      t.index %i[person_id vehicle_id]
      t.index %i[vehicle_id person_id]
    end
  end
end
