class Idea < ActiveRecord::Base
  attr_accessible :title, :concept

  has_many :idea_ranks, :order => "rank"
  has_many :criterias, :through => :idea_ranks
  #acts_as_list :scope => :criteria, :column => "rank"

  after_save :assign_to_criteria

  def assign_to_criteria
    Criteria.all.each {|criteria| self.idea_ranks.build(:criteria_id => criteria.id).save }
  end
end
