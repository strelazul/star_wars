class CreateStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.integer :cost_in_credits
      t.float :length
      t.string :crew
      t.string :passengers
      t.string :max_atmosphering_speed
      t.string :hyperdrive_rating
      t.string :MGLT
      t.string :cargo_capacity
      t.string :consumables

      t.timestamps
    end
  end
end
