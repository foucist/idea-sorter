class IdeaRank < ActiveRecord::Base
  acts_as_list :scope => :criteria, :column => "rank"
  belongs_to :criteria
  belongs_to :idea
end
