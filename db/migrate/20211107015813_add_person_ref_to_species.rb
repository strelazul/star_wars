class AddPersonRefToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_reference :species, :people, null: false, foreign_key: true
    add_reference :species, :planets, null: false, foreign_key: true
    add_reference :species, :films, null: false, foreign_key: true
  end
end
