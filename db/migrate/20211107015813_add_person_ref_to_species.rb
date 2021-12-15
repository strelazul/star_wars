class AddPersonRefToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_reference :species, :planet, foreign_key: true
  end
end
