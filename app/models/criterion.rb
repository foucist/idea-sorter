class Criterion < ActiveRecord::Base
  attr_accessible :title, :rank

  has_many :idea_ranks, :order => "rank"
  has_many :ideas, :through => :idea_ranks, :order => "idea_ranks.rank"

  default_scope :order => "rank"
  acts_as_list :column => "rank"

  after_save :assign_to_ideas

  def assign_to_ideas
    Idea.all.each {|idea| idea.idea_ranks.build(:criterion_id => self.id).save }
  end
end
