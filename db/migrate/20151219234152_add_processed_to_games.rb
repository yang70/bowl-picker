class AddProcessedToGames < ActiveRecord::Migration
  def change
    add_column :games, :processed, :boolean
  end
end
