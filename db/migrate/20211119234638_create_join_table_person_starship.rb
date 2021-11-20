class CreateJoinTablePersonStarship < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :starships do |t|
      t.index %i[person_id starship_id]
      t.index %i[starship_id person_id]
    end
  end
end
