class Idea < ActiveRecord::Base
  attr_accessible :title, :concept

  has_many :idea_ranks, :order => "rank"
  has_many :criteria, :through => :idea_ranks
  #acts_as_list :scope => :criteria, :column => "rank"

  after_save :assign_to_criterion

  def assign_to_criterion
    Criterion.all.each {|criterion| self.idea_ranks.build(:criterion_id => criterion.id).save }
  end

  before_create :set_title_and_concept_from_input
  def set_title_and_concept_from_input
    self.title, self.concept = concept.split('-',2).map {|x| x.strip} unless title
  end
end
