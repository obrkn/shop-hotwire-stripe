# frozen_string_literal: true

require 'application_system_test_case'

class CartItemsTest < ApplicationSystemTestCase
  setup do
    login_as users(:one)
    @cart_item = cart_items(:one)
  end

  test 'Delete a new cart item' do
    visit cart_items_path
    assert_selector 'h1', text: 'MY CART'
    assert_selector 'span#cart-items', text: '1'

    click_button(class: 'delete-item')
    assert_selector 'span#cart-items', text: '0'
  end

  test 'link to cart page' do
    visit cart_items_path

    click_link(id: 'cart')
    assert_selector 'h1', text: 'MY SHOP'
  end
end
