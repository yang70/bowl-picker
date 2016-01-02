class TieBreakerController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tie_breaker, only: [:index, :edit, :update]

  def index
  end

  def edit
  end

  def update
    if @tie_breaker.update_attributes(tie_breaker_params)
      respond_to do |format|
        format.html {}
        format.js
      end
    else
      respond_to do |format|
        format.html{ render :edit }
        format.js { render :edit }
      end
    end
  end

  private

  def tie_breaker_params
    params.require(:tie_breaker).permit(:clemson_score, :alabama_score)
  end

  def set_tie_breaker
    @tie_breaker = TieBreaker.find_by(user: current_user.id)
  end
end
