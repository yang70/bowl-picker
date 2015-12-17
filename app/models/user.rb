class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :picks
  has_many :weekly_scores
  has_one :total_score

  after_create :setup_blank_picks, :setup_scores

  def self.send_weekly_email
    start = Time.parse("2015-09-01 01:00:00 -800")

    week = (Time.now.to_date - start.to_date).to_i / 7

    last_week = week - 1

    users = User.all

    users.each do |user|
      UserMailer.weekly_email(user, last_week).deliver_now
    end
  end

  def self.send_welcome_emails
    users = User.all
    users.each do |user|
      UserMailer.welcome_email(user).deliver_now
    end
  end

  def self.send_reminder_email
    users = User.all

    users.each do |user|
      UserMailer.reminder_email(user).deliver_now
    end
  end

  def self.send_log_in_reminder_email
    users = User.where(sign_in_count: 0)

    users.each do |user|
      UserMailer.log_in_reminder_email(user).deliver_now
    end
  end

  def self.send_incomplete_picks_email
    users = User.all

    users.each do |user|
      picks = Pick.where(user: user)

      nil_picks = picks.select { |pick| pick.winner = nil }

      if nil_picks.length != 0
        picks_left = nil_picks.length
        UserMailer.incomplete_picks_email(user, picks_left).deliver_now
      else
        UserMailer.confirm_picks_email(user).deliver_now
      end
    end
  end

  

  protected

  def get_current_week
    start = Time.parse("2015-09-01 01:00:00 -800")

    (Time.now.to_date - start.to_date).to_i / 7
  end

  def setup_blank_picks
   games = Game.all

   games.each do |game|
     self.picks.create(winner: nil, game_id: game.id, user: self)
   end
  end  

  def setup_scores
    TotalScore.create(user: self, score: 0)
  end

end
