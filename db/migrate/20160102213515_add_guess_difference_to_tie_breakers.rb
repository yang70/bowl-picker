class AddGuessDifferenceToTieBreakers < ActiveRecord::Migration
  def change
    add_column :tie_breakers, :guess_difference, :integer
  end
end
