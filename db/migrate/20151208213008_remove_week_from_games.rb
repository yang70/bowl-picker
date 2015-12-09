class RemoveWeekFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :week_id
  end
end
