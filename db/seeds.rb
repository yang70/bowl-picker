require 'CSV'

CSV.foreach('lib/assets/bowls.csv') do |row|

  game = Game.create!(  date_time: Time.parse(row[4]), 
                        home_team: row[1], 
                        away_team: row[2], 
                        favorite: row[1], 
                        underdog: row[2], 
                        spread_for_away_team: row[3].to_f, 
                        bowl_name: row[0],
                        tv: row[5]
                     )
  game.save 
end

user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
user.save
