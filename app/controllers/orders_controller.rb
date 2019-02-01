# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_orders_belonging_to_current_user, only: %i[index]
  before_action :set_order_items_belonging_to_order, only: %i[show]

  def index; end

  def show; end

  private

    def set_orders_belonging_to_current_user
      @orders = Order.belonging(current_user).all_except('biding')
    end

    def set_order_items_belonging_to_order
      @order_items = Order.find(params[:id]).order_items
    end
end
