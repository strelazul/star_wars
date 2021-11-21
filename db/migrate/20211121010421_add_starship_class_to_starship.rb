class AddStarshipClassToStarship < ActiveRecord::Migration[6.1]
  def change
    add_column(:starships, :starship_class, :string)
  end
end
