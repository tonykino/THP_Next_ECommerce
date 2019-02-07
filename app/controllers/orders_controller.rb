# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_orders_belonging_to_current_user, only: %i[index]
  before_action :set_order_content, only: %i[show]
  before_action :authorize_user, only: %i[show]

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized_error

  def index; end

  def show; end

  private

    def set_orders_belonging_to_current_user
      @orders = Order.belonging(current_user).all_except('biding').
                paginate(page: params[:page]).order('created_at DESC')
    end

    def set_order_content
      @order = Order.find(params[:id])
      @order_items = @order.order_items
    end

    def authorize_user
      authorize @order
    end

    def not_authorized_error
      flash[:alert] = 'Vous ne pouvez pas accéder à une commande qui ne vous appartient pas'
      redirect_back fallback_location: edit_user_registration_path
    end
end
