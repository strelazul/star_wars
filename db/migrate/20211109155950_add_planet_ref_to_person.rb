class AddPlanetRefToPerson < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :planet, foreign_key: true
    add_reference :people, :species, foreign_key: true
  end
end
