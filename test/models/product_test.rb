require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'price' do
    assert_equal 109.95, products(:one).price
  end
end
