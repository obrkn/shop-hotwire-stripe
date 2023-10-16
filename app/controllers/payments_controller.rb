# frozen_string_literal: true

class PaymentsController < ApplicationController
  layout 'payment'
  def new
    payment_intent = Stripe::PaymentIntent.create(
      amount: 3000,
      currency: 'jpy',
      # In the latest version of the API, specifying the `automatic_payment_methods` parameter is optional because Stripe enables its functionality by default.
      automatic_payment_methods: {
        enabled: true
      }
    )
    @client_secret = payment_intent.client_secret
  end
end
