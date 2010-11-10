class Idea < ActiveRecord::Base
  attr_accessible :title, :concept

  has_many :idea_criterias, :order => "position"
  has_many :criterias, :through => :idea_criterias
  acts_as_list :scope => :criteria
end
