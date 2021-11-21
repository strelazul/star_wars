class AddColumnVehicleClassToVehicle < ActiveRecord::Migration[6.1]
  def change
    add_column(:vehicles, :vehicle_class, :string)
  end
end
