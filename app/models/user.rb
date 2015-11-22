class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :picks
  has_many :weekly_scores
  has_one :total_score

  def self.scheduler_test
    if Time.now.strftime("%A") == "Sunday"
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      puts "true path"
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    else
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      puts "false path"
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    end
  end
end
