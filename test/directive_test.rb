require 'test_helper'

class DirectiveTest < MiniTest::Unit::TestCase
  def setup
    @directive = ActionDirector::Directive.new().setup do
      with 1..10      do |input, key| [input, key] end
      otherwise       do [] end
    end
  end

  def test_as_range
    assert_equal @directive.as(1..10), [nil, nil]
  end

  def test_as_another_range
    assert_equal @directive.as(1..13), []
  end

  def test_of_range
    assert_equal @directive.of(1..10, 5), [5, 1..10]
  end

  def test_of_another_range
    assert_equal @directive.of(1..13, 5), []
  end

  def test_from_within_range
    assert_equal @directive.from(5) ,[5, 1..10]
  end

  def test_from_out_of_range
  	assert_equal @directive.from(0), []
  end  
end