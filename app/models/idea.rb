class Idea < ActiveRecord::Base
  attr_accessible :title, :concept

  has_many :idea_ranks, :order => "rank"
  has_many :criterias, :through => :idea_ranks
  #acts_as_list :scope => :criteria, :column => "rank"
end
