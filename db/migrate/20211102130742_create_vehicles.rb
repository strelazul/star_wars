class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :length
      t.string :const_in_credits
      t.string :crew
      t.string :passengers
      t.string :max_atmosphering_speed
      t.stringconsumables :cargo_capacity

      t.timestamps
    end
  end
end
