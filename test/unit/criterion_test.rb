require 'test_helper'

class CriterionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Criterion.new.valid?
  end
end
