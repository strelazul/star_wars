class AddPersonRefToPlanet < ActiveRecord::Migration[6.1]
  def change
    add_reference :planets, :people, foreign_key: true
  end
end
