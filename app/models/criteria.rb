class Criteria < ActiveRecord::Base
  attr_accessible :title

  has_many :idea_criterias, , :order => "position"
  has_many :ideas, :through => :idea_criterias
end
