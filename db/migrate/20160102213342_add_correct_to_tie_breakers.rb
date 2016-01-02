class AddCorrectToTieBreakers < ActiveRecord::Migration
  def change
    add_column :tie_breakers, :correct, :boolean
  end
end
