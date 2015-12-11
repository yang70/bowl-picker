class AddPicUrlToGames < ActiveRecord::Migration
  def change
    add_column :games, :pic_url, :string
  end
end
