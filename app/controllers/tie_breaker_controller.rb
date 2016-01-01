class TieBreakerController < ApplicationController
  before_action :authenticate_user!

  def show
    @tie_breaker = TieBreaker.find_by(user: current_user.id)
  end
end
