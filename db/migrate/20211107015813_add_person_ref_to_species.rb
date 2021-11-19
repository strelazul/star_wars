class AddPersonRefToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_reference :species, :people, foreign_key: true
    add_reference :species, :planets, foreign_key: true
    add_reference :species, :films, foreign_key: true
  end
end
