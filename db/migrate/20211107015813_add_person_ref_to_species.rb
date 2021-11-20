class AddPersonRefToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_reference :species, :planets, foreign_key: true
  end
end
