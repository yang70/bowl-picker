class TieBreaker < ActiveRecord::Base
  belongs_to :user

  validates :clemson_score, numericality: { only_integer: true }
  validates :alabama_score, numericality: { only_integer: true }
end
