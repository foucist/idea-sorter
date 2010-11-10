class Criteria < ActiveRecord::Base
  attr_accessible :title

  has_many :idea_ranks, :order => "rank"
  has_many :ideas, :through => :idea_ranks
end
