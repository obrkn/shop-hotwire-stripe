# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  setup do
    login_as users(:one)
    @cart_item = cart_items(:one)
  end

  test 'Add a new cart item' do
    visit root_path
    assert_selector 'h1', text: 'MY SHOP'
    assert_selector 'span#cart-items', text: '1'

    click_button(class: 'add-cart-btn', match: :first)
    assert_selector 'span#cart-items', text: '2'
  end

  test 'link to cart page' do
    visit root_path

    click_link(id: 'cart')
    assert_selector 'h1', text: 'MY CART'
  end
end
