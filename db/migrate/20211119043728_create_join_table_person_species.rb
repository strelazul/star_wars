class CreateJoinTablePersonSpecies < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :species do |t|
      t.index [:person_id, :species_id]
      t.index [:species_id, :person_id]
    end
  end
end
