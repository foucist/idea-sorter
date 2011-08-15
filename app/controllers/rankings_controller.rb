class RankingsController < ApplicationController
  def show
    @criteria = Criterion.all
    @criterion = Criterion.last
  end
end
