class CreateFilmsStarshipsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :films_starships, id: false do |t|
      t.belongs_to :film, index: true
      t.belongs_to :starship, index: true
    end
  end
end
