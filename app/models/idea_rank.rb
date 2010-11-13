class IdeaRank < ActiveRecord::Base
  acts_as_list :scope => :criterion, :column => "rank"
  belongs_to :criterion
  belongs_to :idea
end
