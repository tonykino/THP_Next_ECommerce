# frozen_string_literal: true

class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_order
  before_action :set_order_items, only: %i[new]
  before_action :authorize_user

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized_error

  def new; end

  def create
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
    send_mail(@order)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

    def set_current_order
      @order = current_order
    end

    def set_order_items
      @order_items = @order.order_items
    end

    def authorize_user
      authorize @order, policy_class: ChargePolicy
    end

    def not_authorized_error
      flash[:alert] = 'Ce panier est vide ou il ne vous appartient pas'
      redirect_back fallback_location: cart_path
    end

    def validate_order
      validate = Order.find(session[:order_id])
      validate.update(status: "validated")
      session[:order_id] = nil
    end

    def send_mail(order)
      OrderMailer.with(user: current_user, order: order).customer_email.deliver_later
      OrderMailer.with(order: order).admin_order_email.deliver_later
    end
end
