require 'test_helper'

class TestDirectiveFrom < MiniTest::Unit::TestCase
  include ActionDirector

  def setup
    @labeling_age = directive('labeling age').setup do
      with 1..17, 18..27, 28..37, 38..47, 48..57 do |age, range| "#{range.begin} - #{range.end}" end
      with 58..100000000000000000000000000000000 do |age, range| "#{range.begin} and above"    end
      otherwise                                  do |age, range| "Unknown"                     end
    end
  end

  def test_from_regular_age
    assert_equal @labeling_age.from(16), "1 - 17"
  end

  def test_from_above_regular_age
    assert_equal @labeling_age.from(99), "58 and above"
  end

  def test_from_no_age
    assert_equal @labeling_age.from(nil), "Unknown"
  end
end
