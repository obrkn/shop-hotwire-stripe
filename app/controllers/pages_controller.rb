class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @cart = session[:cart] ||= {}
    @products = Product.all
    @total = calc_total(@cart)
  end

  def add
    @cart = session[:cart] ||= {}
    @cart[params[:id]] = (@cart[params[:id]] || 0) + 1
    session[:cart] = @cart
    @total = calc_total(@cart)
  end

  private

  def calc_total(cart)
    product_hash = Product.select(:id, :price).where(id: cart.keys).index_by(&:id)
    total = 0.0
    cart.each do |id, quantity|
      total += product_hash[id.to_i].price * quantity if product_hash[id.to_i]
    end
    total.round(2)
  end
end
