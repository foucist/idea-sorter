class Criteria < ActiveRecord::Base
  attr_accessible :title

  has_many :idea_ranks, :order => "rank"
  has_many :ideas, :through => :idea_ranks, :order => "idea_ranks.rank"

  after_save :assign_to_ideas

  def assign_to_ideas
    Idea.all.each {|idea| idea.idea_ranks.build(:criteria_id => self.id).save }
  end

end
