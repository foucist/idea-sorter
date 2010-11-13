class RankingsController < ApplicationController
  def index
    @criterias = Criteria.all
    @criteria = Criteria.first
  end
end
