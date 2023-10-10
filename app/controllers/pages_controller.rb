class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @products = Product.all
    @cart_items = current_user&.cart_items&.eager_load(:product) || []
    @total = @cart_items.map(&:product).map(&:price).sum
  end
end
