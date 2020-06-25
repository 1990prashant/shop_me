require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  
  test "Should return cancelable true" do
    order = Order.new
    order.save
    assert order.cancelable
  end

end
