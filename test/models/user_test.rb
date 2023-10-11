# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'email' do
    assert_equal 'one@example.com', users(:one).email
  end
end
