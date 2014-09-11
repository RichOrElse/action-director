require 'test_helper'

class LookupTest < MiniTest::Unit::TestCase
  def setup
    @directive = ActionDirector::Directive.new().setup do
      with :ok do 'OK' end
    end
  end

  def test_lookup_is_a_proc
    assert_equal @directive[:ok].class, Proc
  end  

  def test_lookup_and_call_ok
    assert_equal @directive[:ok].call, 'OK'
  end
end
