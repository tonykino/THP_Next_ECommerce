# frozen_string_literal: true

class ChargesController < ApplicationController
  def new
    @order = current_order
    @order_items = @order.order_items
  end

  def create
    # Amount in cents
    @order = current_order
    @amount = @order.total.to_i * 100

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Ruby-T',
      currency: 'eur'
    )

    validate_order
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

    def validate_order
      validate = Order.find(session[:order_id])
      validate.update(status: "validated")
    end
end