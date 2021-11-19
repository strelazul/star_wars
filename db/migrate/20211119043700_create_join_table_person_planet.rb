class CreateJoinTablePersonPlanet < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :planets do |t|
      t.index [:person_id, :planet_id]
      t.index [:planet_id, :person_id]
    end
  end
end
