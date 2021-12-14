class CreateJoinTablePersonSpecies < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :species do |t|
      t.index %i[person_id species_id]
      t.index %i[species_id person_id]
    end
  end
end
