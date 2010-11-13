class RankingsController < ApplicationController
  def index
    @criteria = Criterion.all
    @criterion = Criterion.first
  end
end
