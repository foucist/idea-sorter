class IdeaRank < ActiveRecord::Base
  belongs_to :criteria
  belongs_to :idea
  acts_as_list :scope => :criteria
end
