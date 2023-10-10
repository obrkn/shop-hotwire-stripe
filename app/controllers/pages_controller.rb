class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @products = Product.all
    @cart_items = current_user_1.cart_items.eager_load(:product)
    @total = @cart_items.map(&:product).map(&:price).sum
  end

  def add
    CartItem.create(product_id: params[:id], user_id: current_user_1.id)
    @cart_items = current_user_1.cart_items.eager_load(:product)
    @total = @cart_items.map(&:product).map(&:price).sum
  end

  def cart
    @products = Product.all
    @count = current_user_1.cart_items.count
    @total = current_user_1.cart_items.sum(:price)
  end

  private

  def current_user_1
    User.first
  end
end
