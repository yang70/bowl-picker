desc "Random tasks to run"
task :make_picks_mark_kyle => :environment do
  mark = User.find(9)
  kyle = User.find(11)

  mark_picks = Pick.where(user: mark)
  kyle_picks = Pick.where(user: kyle)

  mark_picks.each do |pick|
    game = Game.find(pick.game_id)
    
    if game.id.odd?
      pick.winner = game.favorite
    else
      pick.winner = game.underdog
    end

    pick.save
  end

  kyle_picks.each do |pick|
    game = Game.find(pick.game_id)

    if game.id.even?
      pick.winner = game.favorite
    else
      pick.winner = game.underdog
    end

    pick.save
  end
end

task :create_blank_tb => :environment do
  users = User.all

  users.each do |user|
    tb = TieBreaker.create(user: user)
    tb.save
  end
end

