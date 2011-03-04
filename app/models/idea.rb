class Idea < ActiveRecord::Base
  attr_accessible :title, :concept

  has_many :idea_ranks, :order => "rank"
  has_many :criteria, :through => :idea_ranks
  #acts_as_list :scope => :criteria, :column => "rank"

  after_save :assign_to_criterion

  def assign_to_criterion
    Criterion.all.each {|criterion| self.idea_ranks.build(:criterion_id => criterion.id).save }
  end

  def before_create
    # split that form field for concept into title & concept yeahhhh!
    self.title, self.concept = concept.split('-',2).map {|x| x.strip}
  end
end
