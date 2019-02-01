# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :orders_belonging_to_current_user, only: %i[index]
  before_action :set_order, only: [:show]

  def index; end

  def show; end

  private

    def orders_belonging_to_current_user
      @orders = Order.belonging(current_user).all_except('biding')
    end

    def set_order
      @order = Order.find(params[:id]).order_items
    end
end
