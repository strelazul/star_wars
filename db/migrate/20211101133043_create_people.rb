class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birth_year
      t.string :yey_color
      t.string :gender
      t.string :hair_color
      t.integer :height
      t.integer :mass
      t.string :skin_color

      t.timestamps
    end
  end
end
