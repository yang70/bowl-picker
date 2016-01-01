class CreateTieBreakers < ActiveRecord::Migration
  def change
    create_table :tie_breakers do |t|
      t.integer :user_id
      t.integer :clemson_score
      t.integer :alabama_score

      t.timestamps null: false
    end
  end
end
