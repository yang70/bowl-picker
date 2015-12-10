require 'csv'

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

emails = [
  "hopejohanson@gmail.com",
  "meivan@aol.com",
  "yang70@gmail.com",
  "xtinemueller@gmail.com",
  "vny17@aol.com",
  "muellermc@yahoo.com",
  "mog110@hotmail.com",
  "robyn.m.yang@gmail.com",
  "fshn4x4@gmail.com",
  "txyingyang@aol.com",
  "kyle@freedomsolarpower.com",
  "matt.walker921@gmail.com",
  "frazierjen@gmail.com",
  "melissa.Walker@solarwinds.com",
  "txyingyang@gmail.com" 
  ]

emails.each do |email|
  User.create!(email: email, password: "changeme", password_confirmation: "changeme")
end
