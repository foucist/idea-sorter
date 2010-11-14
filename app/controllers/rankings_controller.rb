class RankingsController < ApplicationController
  def show
    @criteria = Criterion.all
    @criterion = Criterion.first
  end
end
