require 'test_helper'

class CriteriaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Criteria.new.valid?
  end
end
