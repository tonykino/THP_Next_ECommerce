# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_orders_belonging_to_current_user, only: %i[index]
  before_action :order_content, only: %i[show]

  def index; end

  def show; end

  private

    def set_orders_belonging_to_current_user
      @orders = Order.belonging(current_user).all_except('biding')
    end

    def order_content
      @order = Order.find(params[:id])
      @order_items = @order.order_items
    end
end
