class AddTvToGames < ActiveRecord::Migration
  def change
    add_column :games, :tv, :string
  end
end
