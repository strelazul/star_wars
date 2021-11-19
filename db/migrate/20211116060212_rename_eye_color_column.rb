class RenameEyeColorColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column(:people, :yey_color, :eye_color)
  end
end
