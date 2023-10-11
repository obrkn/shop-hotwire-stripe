# frozen_string_literal: true

# Cart items controller
class CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items.eager_load(:product)
    @total = @cart_items.map(&:product).sum(&:price)
    @cart_products = @cart_items.map(&:product).uniq
    @product_count_by_id = @cart_items.map(&:product_id).each_with_object(Hash.new(0)) { |id, counts| counts[id] += 1 }
  end

  def create
    CartItem.create(product_id: params[:product_id], user_id: current_user.id)
    @cart_items = current_user.cart_items.eager_load(:product)
    @total = @cart_items.map(&:product).sum(&:price)
  end

  def destroy
    CartItem.where(product_id: params[:id], user_id: current_user.id).destroy_all
    @cart_items = current_user.cart_items.eager_load(:product)
    @total = @cart_items.map(&:product).sum(&:price)
  end
end
