class AddBowlNameToGames < ActiveRecord::Migration
  def change
    add_column :games, :bowl_name, :string
  end
end
