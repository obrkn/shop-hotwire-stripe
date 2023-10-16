# frozen_string_literal: true

class PaymentsController < ApplicationController
  layout 'payment'

  def new
    cart_items = current_user&.cart_items&.eager_load(:product) || []
    @total = cart_items.map(&:product).sum(&:price).round(2)

    payment_intent = Stripe::PaymentIntent.create(
      amount: (@total * 100).round,
      currency: 'cad',
      automatic_payment_methods: {
        enabled: true
      }
    )
    @client_secret = payment_intent.client_secret
  end
end
